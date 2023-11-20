class Room < ApplicationRecord
  validates :room_number, presence: true,  length: {minimum: 3, maximum: 30}
  validates :description, presence: true
  validates :price, presence: true

  belongs_to :hotel, optional: true
  has_many :bookings

  def display_name
    "#{self.room_number} - #{self.price}$"
  end

end
