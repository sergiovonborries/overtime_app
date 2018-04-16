require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      user = User.create(email: "test@test.com", password: "asdfasdf",
        password_confirmation: "asdfasdf", first_name:"Juan", last_name: "Perez")
      login_as(user, :scope => :user)
      @post = Post.create(date: Time.zone.today, rationale: "Cualquier texto aqui", user_id: user.id)
    end

    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be created without a date and rationale" do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
  end
end
