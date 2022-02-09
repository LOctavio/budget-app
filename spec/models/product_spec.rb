require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:author) { User.create(id: 1, name: 'Luis', email: 'luis@gmail.com', password: 'luis123') }
  before do
    @product = author.products.create(name: 'rice', amount: 20)
    @group = author.groups.new(
      name: 'food',
      icon: Rack::Test::UploadedFile.new('spec/support/no_image_icon.svg', 'no_image_icon.svg'))
    @product.groups << @group
  end
  subject { @product }

  it 'Name must not be blank' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'Name must be present' do
    expect(subject).to be_valid
  end

  it 'Amount must not be less or equal to 0' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end

  it 'Amount must be greater than 0' do
    expect(subject).to be_valid
  end

  it 'Must have at least 1 category' do
    expect(subject).to be_valid
  end
end
