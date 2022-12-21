class Room < ApplicationRecord
  mount_uploader :room_img,ImageUploader

  belongs_to :member, optional: true
  has_many :reservations
end
