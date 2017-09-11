require 'rails_helper'

RSpec.describe Instrument, type: :model do
  #let(:user) { build_stubbed(:user) }
  #let(:user) { User.create(name: "Example User", email: "user@example.com", password:"password", password_confirmation:"password")}
  let(:instrument) { build_stubbed(:instrument) }

  it "is valid with valid attributes" do
    expect(instrument).to be_valid
  end

  it "is not valid without a name" do
    instrument.name = nil
    expect(instrument).to_not be_valid
  end

  it "is not valid with a name longer than 40 character" do
    instrument.name = "a" * 41
    expect(instrument).to_not be_valid
  end  

  it "is not valid without a abbrevation" do
    instrument.abbrevation = nil
    expect(instrument).to_not be_valid
  end

  it "is not valid with an abbrevation longer than 10 character" do
    instrument.abbrevation = "a" * 11
    expect(instrument).to_not be_valid
  end  

  it "is not valid without a size" do
    instrument.size = nil
    expect(instrument).to_not be_valid
  end  

  it "is not valid without a price per month" do
    instrument.price_per_month = nil
    expect(instrument).to_not be_valid
  end

  it "is not valid with price/month higher than 20 Euro" do
    instrument.price_per_month = 21.0
    expect(instrument).to_not be_valid
  end 

end


# @user = users(:michael)
# This code is not idiomatically correct.
# @micropost = Micropost.new(content: "Lorem ipsum", user_id: @user.id)
