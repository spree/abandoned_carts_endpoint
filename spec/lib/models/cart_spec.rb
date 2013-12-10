require 'spec_helper'

describe Cart do
  let(:cart) { Fabricate(:cart) }

  it "is valid" do
    cart.should be_valid
  end

  it "not valid when number not unique" do
    cart2 = Fabricate(:cart)
    cart2.number = cart.number
    cart2.should_not be_valid
  end

  it "not valid without number" do
    cart.number = nil
    cart.should_not be_valid
  end

  it "not valid without payload" do
    cart.payload = nil
    cart.should_not be_valid
  end

  it "not valid without last_activity_at" do
    cart.last_activity_at = nil
    cart.should_not be_valid
  end
end