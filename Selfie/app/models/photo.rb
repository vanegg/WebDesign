class Photo < ActiveRecord::Base
  validates :photo, presence: true
  belongs_to :album
  # El segundo parámetro es el nombre del uploader que se genera el paso 4
  mount_uploader :photo, PhotoUploader
end