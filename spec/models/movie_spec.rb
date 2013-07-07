require 'spec_helper'

describe Movie do
  it "requires a title" do
    subject.valid?
    expect(subject).to have(1).error_on(:title)
  end
  it "has many showtimes" do
    showtime = mock_model("Showtime")
    subject.showtimes << showtime
    expect(subject.showtimes).to include(showtime)
  end
end
