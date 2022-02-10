require 'rails_helper'

RSpec.describe 'Products', type: :system do
  describe 'Index' do
    before(:each) do
      author = User.create(name: 'Luis', email: 'luis@gmail.com', password: '123456')
      @group = author.groups.create(
      name: 'Food',
      icon: Rack::Test::UploadedFile.new('spec/support/no_image_icon.svg', 'no_image_icon.svg'))
      product = author.products.new(name: 'rice', amount: 20)
      product.groups << @group
      product.save
      visit new_user_session_path
      fill_in 'Email', with: 'luis@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'log in'
      visit group_products_path(group_id: @group.id)
    end
    it "Can see the title 'rice'" do
      expect(page).to have_content('rice')
    end
    it 'Can see the total of the category' do
      expect(page).to have_content('$20')
    end
    it "Can see the 'add a new product' button" do
      expect(page).to have_button('add a new product')
    end
    it "When I click the 'add new product' I am redirected to the 'Add a new product' page." do
      click_button 'add a new product'
      expect(page).to have_current_path(new_group_product_path(group_id: @group.id))
    end
  end
end