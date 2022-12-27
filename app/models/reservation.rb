class Reservation < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :room

  validates :start_at,presence: true
  validates :end_at,presence: true
  validates :number,numericality: true,inclusion: {in: 1..10},presence: true
  validate :date_before_start
  validate :date_before_finish

  def sum_of_days
    (end_at.to_date - start_at.to_date).to_i
  end

  def sum_of_price
    room.price  *  number   * (end_at.to_date - start_at.to_date).to_i
  end

  def date_before_start
    return if start_at.blank?
    errors.add(:start_at, "は今日以降のものを選択してください") if start_at < Date.today
  end
  
  def date_before_finish
    return if end_at.blank? || start_at.blank?
    errors.add(:end_at, "は開始日以降のものを選択してください") if end_at < start_at
  end

end
