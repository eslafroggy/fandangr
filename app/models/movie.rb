class Movie < ActiveRecord::Base
  has_many :showtimes
  attr_accessible :title
  validates :title, :presence => true
end
