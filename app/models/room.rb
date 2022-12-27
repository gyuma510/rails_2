class Room < ApplicationRecord
  mount_uploader :room_img,ImageUploader

  belongs_to :member, optional: true
  has_many :reservations

  validates :name,presence: true
  validates :introduction,presence: true
  validates :price,numericality: {only_integer: true, greater_than_or_equal_to: 1},presence: true
  validates :adress,presence: true
  validates :room_img,presence: true

end
