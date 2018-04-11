require 'rails_helper'

describe 'navigate' do
  describe 'index' do
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
  end
end
