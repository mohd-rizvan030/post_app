require 'rails_helper'

RSpec.describe Post, type: :model do
  it "creates a post" do
    @user = FactoryGirl.create(:user, :id => 1)
    expect(Post.create(title: "Test1", url: "url1", user_id: @user.id)).to be_valid
  end

  it "does not create a post" do
    @user = FactoryGirl.create(:user, :id => 1)
    expect(Post.create(title: "Test1", url: nil, user_id: @user.id)).to be_invalid
  end
end
