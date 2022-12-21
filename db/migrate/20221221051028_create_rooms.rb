class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string "name"
      t.text "introduction"
      t.integer "price"
      t.text "adress"
      t.string "room_img"
      t.integer "member_id"
      t.datetime "start_at"

      t.timestamps
    end
  end
end
