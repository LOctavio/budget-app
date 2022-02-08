require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:author) { User.create(id: 1, name: 'Luis', email: 'luis@gmail.com', password: 'luis123') }
  before do
    @group = author.groups.new(name: 'food', icon: 'icon')
  end
  subject { @group }

  it 'Name must not be blank' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'Name must be present' do
    expect(subject).to be_valid
  end

  it 'Icon must not be blank' do
    subject.icon = ''
    expect(subject).to_not be_valid
  end

  it 'Icon must be present' do
    expect(subject).to be_valid
  end
end
