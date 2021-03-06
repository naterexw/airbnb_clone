class Room < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :bookings

  geocoded_by :address
  after_validation :geocode, if: :address_changed? # auto-fetch coordinates

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accomodate, presence: true
  validates :bedroom, presence: true
  validates :bathroom, presence: true
  validates :listing_name, presence: true, length: { maximum: 50 }
  validates :summary, presence: true, length: { maximum: 500 }
  validates :address, presence: true
  validates :price, presence: true
end
