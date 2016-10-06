class Comment < ActiveRecord::Base
  validates :text, :author, presence: true
end
