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
end
