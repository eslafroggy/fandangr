require 'spec_helper'

describe Seat do
  it "requires a row" do
    subject.valid?
    expect(subject).to have(1).error_on(:row)
  end
  it "requires a seat_number" do
    subject.valid?
    expect(subject).to have(1).error_on(:seat_number)
  end
  it "requires a showtime_id" do
    subject.valid?
    expect(subject).to have(1).error_on(:showtime_id)
  end
  it "belongs to a showtime" do
    showtime = mock_model("Showtime")
    subject.showtime = showtime
    expect(subject.showtime).to eql(showtime)
  end
  it "belongs to a user" do
    user = mock_model("User")
    subject.user = user
    expect(subject.user).to eql(user)
  end
  describe "#purchased?" do
    it "is true if the seat has been purchased" do
      subject.user = mock_model("User")
      expect(subject).to be_purchased
    end
    it "it is false if the seat has not been purchased" do
      expect(subject).not_to be_purchased
    end
  end
end
