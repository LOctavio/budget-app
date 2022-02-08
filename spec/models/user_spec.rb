require 'rails_helper'

RSpec.describe User, type: :model do
  before { @author = User.create(name: 'Luis', email: 'luis@gmail.com', password: 'luis123') }
  subject { @author }

  it 'Name must not be blank' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'Name must be present' do
    expect(subject).to be_valid
  end
end
