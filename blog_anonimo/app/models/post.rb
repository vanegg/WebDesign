class Post < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, :body, presence: true
  # has_and_belongs_to_many :tags
  #OR
  has_many :post_tags
  has_many :tags, through: :post_tags
end
