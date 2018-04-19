require 'rails_helper'

describe 'navigate admin dashboard' do

  it 'redirects to sign in page when users are not loged in' do
    visit admin_root_path
    expect(current_path).to eq(new_user_session_path)
  end

  it 'cannot be reached by non admin users' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
    visit admin_root_path
    expect(current_path).to eq(root_path)
  end

  it 'can be reached by an admin users' do
    admin_user = FactoryBot.create(:admin_user)
    login_as(admin_user, scope: :user)
    visit admin_root_path
    expect(current_path).to eq(admin_root_path)
  end
end
