require "rails_helper"

RSpec.describe User, type: :model do
  it "cannot store the same user twice" do
    user1 = User.create(facebook_id: 3434, first_name: "Andy", timezone: 2)
    user2 = User.create(facebook_id: 3434, first_name: "Andy", timezone: 2)

    expect(user2).not_to be_valid
  end


  it "must have a name" do
    user = User.create(facebook_id: 3434, first_name: "", timezone: 2)
    expect(user).not_to be_valid
  end

  it "must have a Facebook ID" do
    user = User.create(first_name: "Andy", timezone: 2)
    expect(user).not_to be_valid
  end
end