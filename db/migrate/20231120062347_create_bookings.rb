class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :room_id
      t.string :code
      t.datetime :date_start
      t.datetime :date_end

      t.timestamps
    end
  end
end
