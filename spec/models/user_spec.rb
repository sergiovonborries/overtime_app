require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user = User.create(email: "test@test.com", password: "asdfasdf",
        password_confirmation: "asdfasdf", first_name:"Juan", last_name: "Perez")
    end
    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first_name and last_name" do
      @user.last_name = nil
      @user.first_name = nil
      expect(@user).to_not be_valid
    end
  end
end
