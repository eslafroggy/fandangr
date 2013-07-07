class Showtime < ActiveRecord::Base
  belongs_to :movie
  attr_accessible :movie_id, :time
  validates :time, :presence => true
  validates :movie_id, :presence => true
end
