require 'spec_helper'

describe Movie do
  it "requires a title" do
    subject.valid?
    expect(subject.errors).to have(1).error_on(:title)
  end
end
