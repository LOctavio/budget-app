require 'rails_helper'

RSpec.describe 'Categories', type: :system do
  describe 'Index' do
    before(:each) do
      author = User.create(name: 'Luis', email: 'luis@gmail.com', password: '123456')
      author.groups.create(
      name: 'Food',
      icon: Rack::Test::UploadedFile.new('spec/support/no_image_icon.svg', 'no_image_icon.svg'))
      visit new_user_session_path
      fill_in 'Email', with: 'luis@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'log in'
    end
    it "Can see the title 'Food'" do
      expect(page).to have_content('Food')
    end
    it 'Can see the total of the category' do
      expect(page).to have_content('$0')
    end
    it "Can see the 'add new category' button" do
      expect(page).to have_button('add a new category')
    end
    it "When I click the 'add new category' I am redirected to the 'Add a new category' page." do
      click_button 'add a new category'
      expect(page).to have_current_path(new_group_path)
    end
  end
end