require 'rails_helper'

RSpec.describe 'Products', type: :system do
  describe 'New' do
    before(:each) do
      author = User.create(name: 'Luis', email: 'luis@gmail.com', password: '123456')
      group = author.groups.create(
      name: 'Food',
      icon: Rack::Test::UploadedFile.new('spec/support/no_image_icon.svg', 'no_image_icon.svg'))
      visit new_user_session_path
      fill_in 'Email', with: 'luis@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'log in'
      visit new_group_product_path(group_id: group.id)
    end
    it 'Can see the name input' do
      expect(page).to have_field('Name')
    end
    it 'Can see the amount input' do
      expect(page).to have_field('Amount')
    end
    it 'Can see the radio button' do
      expect(page).to have_field('groups[]')
    end
    it 'When I click the save button without filling in the name, the amount, and check the radio button
    I get a detailed error.' do
      click_button 'save'
      expect(page).to have_content('Your product was not created')
    end
    it 'When I click the save button after filling in the name, the amount, and check the radio button with correct data,
    I am redirected to the root page.' do
      fill_in 'Name', with: 'Food'
      fill_in 'Amount', with: '10'
      check('groups[]')
      click_button 'save'
      expect(page).to have_current_path(root_path)
    end
  end
end