require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
      user = User.create(email: "test@test.com", password: "asdfasdf",
        password_confirmation: "asdfasdf", first_name:"Juan", last_name: "Perez")
      login_as(user, :scope => :user)
    end
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Post' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe 'creation' do
    before do
      user = User.create(email: "test@test.com", password: "asdfasdf",
        password_confirmation: "asdfasdf", first_name:"Juan", last_name: "Perez")
      login_as(user, :scope => :user)
      visit new_post_path
    end
    it 'has a new form to create Post' do

      expect(page.status_code).to eq(200)
    end

    it 'can be created from a form New Page' do
      fill_in 'post[date]', with: Time.zone.today
      fill_in 'post[rationale]', with: "Some rationale data"

      click_on "Save"

      expect(page).to have_content("Some rationale data")
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Time.zone.today
      fill_in 'post[rationale]', with: "User Association"

      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end
end
