class Reservation < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :room

  def sum_of_days
    (end_at.to_d - start_at.to_d).to_i
  end

 
end
