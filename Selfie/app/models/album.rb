class Album < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, presence: true
  belongs_to :user
  has_many :photos
end
