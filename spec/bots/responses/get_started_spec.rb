require "rails_helper"
require 'ostruct'


RSpec.describe GetStarted do

  before(:all) do
    @user = User.create(facebook_id: 3434, first_name: "Andy", timezone: 2)
    @postback = OpenStruct.new({recipient: {id: "1744727782491297"}, :timestamp => 1496969283154, sender: {id: "1233611816764720"}, postback: {:payload => "GetStarted"}})
  end

  it "is available as described_class" do
    expect(described_class).to eq(GetStarted)
  end

  it "builds an array of two" do
    response = GetStarted.new(@postback, @user).call
    expect(response.size).to eq(2)
  end

  it "responds by greeting the user by their first_name" do
    response = GetStarted.new(@postback, @user).call
    expect(response.first[:text]).to eq("Hello, Andy")
  end

  it "responds a second time with a message" do
    response = GetStarted.new(@postback, @user).call
    message = "I am a bot"
    expect(response.last[:text]).to eq(message)
  end

end