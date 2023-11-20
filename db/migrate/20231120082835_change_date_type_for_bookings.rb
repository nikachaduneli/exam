class ChangeDateTypeForBookings < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :date_end, :date
    change_column :bookings, :date_start, :date
  end
end
