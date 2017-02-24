class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :start_date, date: true
  validates :start_date, date: { before: :end_date }
  validates :end_date, date: true
  validates :end_date, date: { after: :start_date }

  validates :price, presence: true
  validates :total_price, presence: true
end
