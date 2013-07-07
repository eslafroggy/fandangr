class Showtime < ActiveRecord::Base
  class SeatNotFound < StandardError; end
  class SeatAlreadyPurchased < StandardError; end   
    
  belongs_to :movie
  has_many :seats
  attr_accessible :movie_id, :time, :movie
  validates :time, :presence => true
  validates :movie_id, :presence => true
  
  def purchase_seat(row, seat_number, user)
    seat = seats.where(row: row, seat_number: seat_number).first
    raise SeatNotFound unless seat
    raise SeatAlreadyPurchased if seat.purchased?
    seat.user = user
    seat.save! #if fails to save raises an exception
    seat
  end
end
