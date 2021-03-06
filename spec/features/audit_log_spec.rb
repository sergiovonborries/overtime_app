require 'rails_helper'

describe 'AuditLog Features' do

  describe 'index' do
    before do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, :scope => :user)
      FactoryBot.create(:audit_log)
    end
    it 'has an index page that can be reach' do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it 'renders audit log content' do
      visit audit_logs_path
      expect(page).to have_content(/Perez, Juan/)
    end
  end
end
