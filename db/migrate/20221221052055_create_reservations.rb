class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer "price"
      t.datetime "start_at"
      t.datetime "end_at"
      t.integer "number"
      t.integer "room_id"
      t.integer "member_id"

      t.timestamps
    end
  end
end
