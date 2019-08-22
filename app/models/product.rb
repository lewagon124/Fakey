class Product < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :image, PhotoUploader
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:name],
    using: {
      tsearch: { prefix: true }
    }
end
