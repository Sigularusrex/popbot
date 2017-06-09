require "rails_helper"
require 'ostruct'


RSpec.describe FetchUser do

  before(:all) do
    @postback = OpenStruct.new({recipient: {id: "1744727782491297"}, :timestamp => 1496969283154, sender: {id: "1233611816764720"}, postback: {:payload => "GetStarted"}})
  end

  it "is available as described_class" do
    expect(described_class).to eq(FetchUser)
  end

  it "initialises a FetchUser object with a message(postback)" do
    user = FetchUser.new(@postback)
    expect(user.message).to eq(@postback)
  end

  it "expects to return a User object" do
    user = FetchUser.new(@postback).call

    expect(user.class).to eq(User)
  end

  it "expects to return a User object with first_name == David" do
    user = FetchUser.new(@postback).create_user(12345, "David", 1)
    expect(user.first_name).to eq("David")
  end

  # This fails right now due to improper page permissions
  #It works fine on the bot because the user it's requesting is also signed in on the browser
  xit "expects to return a hash with first_name and timezone" do
    user = FetchUser.new(@postback).get_facebook_user(1233611816764720)
    puts user.inspect
    expect(user["first_name"]).to eq("David")
    expect(user["timezone"]).to eq(1)
  end

end