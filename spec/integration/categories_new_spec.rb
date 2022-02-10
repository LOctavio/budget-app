require 'rails_helper'

RSpec.describe 'Categories', type: :system do
  describe 'New' do
    before(:each) do
      User.create(name: 'Luis', email: 'luis@gmail.com', password: '123456')
      visit new_user_session_path
      fill_in 'Email', with: 'luis@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'log in'
      visit new_group_path
    end
    it 'Can see the name input' do
      expect(page).to have_field('Name')
    end
    it 'Can see the icon file field' do
      expect(page).to have_field('group_icon')
    end
    it 'When I click the save button without filling in the name and the icon,
    I get a detailed error.' do
      click_button 'save'
      expect(page).to have_content('Your category was not created')
    end
    it 'When I click the save button after filling in the name and the icon with correct data,
    I am redirected to the root page.' do
      fill_in 'Name', with: 'Food'
      attach_file('group_icon', "#{Rails.root}/spec/support/no_image_icon.svg")
      click_button 'save'
      expect(page).to have_current_path(root_path)
    end
  end
end
