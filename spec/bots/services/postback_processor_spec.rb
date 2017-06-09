require "rails_helper"

RSpec.describe PostbackProcessor do

  before(:all) do
    @user = User.create(facebook_id: 3434, first_name: "Andy", timezone: 2)
    @postback = OpenStruct.new({recipient: {id: "1744727782491297"}, :timestamp => 1496969283154, sender: {id: "1233611816764720"}, postback: {:payload => "GetStarted"}})
  end

  it "is available as described_class" do
    expect(described_class).to eq(PostbackProcessor)
  end

  xit "initialises a FetchUser object with a message(postback)" do
    response = PostbackProcessor.new(@postback, @user).call
    expect(response).to eq(@postback)
  end

end