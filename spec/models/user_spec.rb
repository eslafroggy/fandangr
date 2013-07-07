require 'spec_helper'

describe User do
  it "requires a email" do
    subject.valid?
    expect(subject).to have(1).error_on(:email)
  end
end
