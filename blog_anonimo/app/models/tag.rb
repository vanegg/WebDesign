class Tag < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, uniqueness: true
  # has_and_belongs_to_many :posts
  #OR
  has_many :post_tags
  has_many :posts, through: :post_tags
end
