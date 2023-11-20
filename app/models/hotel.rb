class Hotel < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3, maximum: 30}, uniqueness: true
  validates :address, presence: true
  has_many :rooms
  has_many :bookings, through: :rooms
  validate :room_not_from_other_hotel


  def room_not_from_other_hotel
    rooms.each do |room|
      if room.hotel && room.hotel != self
        errors.add(:rooms, "#{room.room_number} belongs to  Hotel: #{room.hotel.name}.")
      end
    end
  end
end
