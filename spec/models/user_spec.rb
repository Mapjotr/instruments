require 'rails_helper'

RSpec.describe Instrument, type: :model do

  let(:user) { build_stubbed(:user, :admin) }
  let(:user_saved) { create(:user, :admin) }

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user.name = "   "
    expect(user).not_to be_valid
  end

  it "is not valid without an email address" do
    user.email = "     "
    expect(user).not_to be_valid
  end

  it "is not valid with a too long name" do
    user.name = "a" * 51
    expect(user).not_to be_valid
  end

  it "is not valid with a too long email" do
    user.name = "a" * 244 + "@testmail.com"
    expect(user).not_to be_valid
  end

  it "should accept valid email addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).to be_valid, "#{valid_address.inspect} should be valid" #second argument is a custom error message
    end
  end

  it "should reject email invalid addresses" do
    invalid_addresses = %w[user@example. user.de user@example,com
                         foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user).not_to be_valid, "#{invalid_address.inspect} should be invalid"
    end
  end

  it "is not valid with an already taken email address" do
    duplicate_user = user_saved.dup
    duplicate_user.email = user_saved.email.upcase
    expect(duplicate_user).not_to be_valid
  end

  it "should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    user = create(:user, :admin, :email => mixed_case_email)
    user.email = mixed_case_email
    expect(mixed_case_email.downcase).to eq(user.reload.email)
  end

  it " is not valid witout password (nonblank)" do
    user.password = user.password_confirmation = " " * 6
    expect(user).not_to be_valid
  end

  it "is not valid with a password <= 5 characters" do
    user.password = user.password_confirmation = "a" * 5
    expect(user).not_to be_valid
  end

  it "authenticated? should return false for a user with nil digest" do
    expect(user.authenticated?(:remember,'')).to be_falsy
  end

end