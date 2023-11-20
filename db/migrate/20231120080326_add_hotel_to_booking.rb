class AddHotelToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :hotel_id, :integer
  end
end
