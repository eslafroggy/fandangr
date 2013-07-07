require 'spec_helper'

describe Showtime do
  it "requires a time" do
    subject.valid?
    expect(subject).to have(1).error_on(:time)
  end
  it "must belong to a movie" do
    subject.valid?
    expect(subject).to have(1).error_on(:movie_id)
  end
  it "belongs to a movie" do
     movie = mock_model("Movie")
     subject.movie = movie
     expect(subject.movie).to eql(movie) # eql is more specific than eq
  end
  it "has many seats" do
     seat = mock_model("Seat")
     subject.seats << seat
     expect(subject.seats).to include(seat) 
  end
  describe "#purchase_seat" do
     let(:movie) { Movie.create(title: "Debbie Does Dallas") }
     subject {described_class.create!( time: Time.now, movie: movie)}
     let(:seat) {subject.seats.create!(row: 1, seat_number: 1)}
     let(:user) {User.create!(email: "buttsexx@buttsexx.com")}
    it "sells the user a seat if it's available" do
      seat
      purchased_seat = subject.purchase_seat(1, 1, user)
      expect(purchased_seat.user).to eql(user)       
    end
    it "raises seat not found if there is no such seat" do
      expect {subject.purchase_seat(1, 1, user)}.to raise_error(
        Showtime::SeatNotFound
      )
    end
    it "raises seat already purchased if seat is not available" do
      seat
      subject.purchase_seat(1, 1, user)
      expect { subject.purchase_seat(1, 1, user)}.to raise_error(
        Showtime::SeatAlreadyPurchased
      )
    end
  end
end
