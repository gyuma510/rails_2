class Room < ApplicationRecord
  mount_uploader :room_img,ImageUploader

  belongs_to :member, optional: true
  has_many :reservations

  validates :name,presence: true
  validates :introduction,presence: true
  validates :price,numericality: true,presence: true
  validates :adress,presence: true
  validates :room_img,presence: true
  validates :sum_of_days,presence: true
  validates :sum_of_price,presence: true


end
