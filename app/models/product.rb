class Product < ApplicationRecord
  belongs_to :user
  has_many :booking
  mount_uploader :image, PhotoUploader
end
