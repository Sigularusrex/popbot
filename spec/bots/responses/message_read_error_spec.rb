require "rails_helper"
require 'ostruct'


RSpec.describe MessageReadError do


  it "is available as described_class" do
    expect(described_class).to eq(MessageReadError)
  end

  it "responds with a friendly message" do
    response = MessageReadError.new().call
    expect(response).not_to be_empty
  end

  it "builds an array of 1" do
    response = MessageReadError.new().call
    expect(response.size).to eq(1)
  end


end