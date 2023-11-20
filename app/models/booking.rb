class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :hotel
  before_save {self.code = generate_random_code }
  validate :validate_dates


  def duration
    (date_end - date_start).to_i
  end
  def total_price
    room.price * duration
  end

  def generate_random_code
    len = 8
    SecureRandom.alphanumeric(len)
  end


  def validate_dates
    bookings = Booking.where(room_id: room_id)
    bookings.each do |booking|
      if overlapping_dates?(booking)
        errors.add(:date_start, 'Selected dates overlap with existing booking.')
        break
      end
    end
    if start_date_gt_date_end?
      errors.add(:date_start, 'should not be grater than end date.')
    end

  end

  def overlapping_dates?(other_booking)
    (date_start - other_booking.date_end) * (other_booking.date_start - date_end) >= 0
  end

  def start_date_gt_date_end?
    date_start > date_end
  end
end
