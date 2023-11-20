class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :room_number
      t.float :price
      t.text :description
      t.integer :hotel_id, null: true

      t.timestamps
    end
  end
end
