class Url < ActiveRecord::Base
  # Remember to create a migration!
  validates :long_url, format: { with: /http(s*)\D{3}/, message: "INVALID URL"}
  belongs_to :user

  before_create :create_short_url

  def create_short_url    
    @short_url = [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
    self.short_url = @short_url
  end

  def self.find_url(url)
    Url.increment_count_visits(url)
    Url.find_by(short_url: url).long_url
  end

  def self.increment_count_visits(url)
    if Url.exists?(short_url: url)
      complete_url = Url.find_by(short_url: url)
      complete_url.click_count += 1
      complete_url.save()
    end
  end

end
