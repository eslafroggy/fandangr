class Seat < ActiveRecord::Base
  belongs_to :showtime
  belongs_to :user
  attr_accessible :row, :seat_number, :showtime_id, :user_id
  validates :row, :presence => true
  validates :seat_number, :presence => true
  validates :showtime_id, :presence => true
  
  def purchased?
    user.present? 
  end
end
