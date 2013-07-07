# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
  "Vibrations",
  "Glitter",
  "Debbie Does Dallas"
].each do |title|
  movie = Movie.create!(title: title)
 
  [Time.now, 3.hours.from_now, 6.hours.from_now].each do |time|
    showtime = movie.showtimes.create(time: time)
    showtime.seats.create!([
      { row: 1, seat_number: 1 },
      { row: 1, seat_number: 2 },
      { row: 1, seat_number: 3 },
      { row: 1, seat_number: 4 },
      { row: 1, seat_number: 5 },
      { row: 2, seat_number: 1 },
      { row: 2, seat_number: 2 },
      { row: 2, seat_number: 3 },
      { row: 2, seat_number: 4 },
      { row: 2, seat_number: 5 },
      { row: 3, seat_number: 1 },
      { row: 3, seat_number: 2 },
      { row: 3, seat_number: 3 },
      { row: 3, seat_number: 4 },
      { row: 3, seat_number: 5 }
    ])
  end
end    
  