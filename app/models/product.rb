class Product < ApplicationRecord
  belongs_to :user
  has_many :bookings

  mount_uploader :image, PhotoUploader

end
