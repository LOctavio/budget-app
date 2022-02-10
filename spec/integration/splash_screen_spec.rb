require 'rails_helper'

RSpec.describe 'splash screen', type: :system do
  describe 'slash screen' do
    before(:each) do
      visit root_path
    end
    it "Can see the title 'Shopping Record'" do
      expect(page).to have_content('Shopping Record')
    end
    it 'Can see the log in button' do
      expect(page).to have_button('log in')
    end
    it 'Can see the sign up button' do
      expect(page).to have_button('sign up')
    end
    it 'When I click the log in button I am redirected to the log in page.' do
      click_button 'log in'
      expect(page).to have_current_path(new_user_session_path)
    end
    it 'When I click the sign up button I am redirected to the sign up page.' do
      click_button 'sign up'
      expect(page).to have_current_path(new_user_registration_path)
    end
  end
end