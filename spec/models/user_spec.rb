require 'rails_helper'

#comment

RSpec.describe User, type: :model do
  let(:user) {FactoryGirl.build :user}
  subject { user }

  it { is_expected.to be_valid }

  context 'when the user name is blank' do
    let(:user) { FactoryGirl.build(:user, name: '    ') }

    it { is_expected.to have_at_least(1).errors_on(:name) }
  end

  it 'requires an email' do
    user = FactoryGirl.build(:user, email: '    ')

    expect(user).to have_at_least(1).errors_on(:email)
  end

  it 'has a reasonably sized name' do
    user = FactoryGirl.build(:user, name: 'a' * 51)

    expect(user).to have_at_least(1).errors_on(:name)
  end

  it 'has a reasonably sized email' do
    user = FactoryGirl.build(:user, email: 'a' * 244 + '@example.com')

    expect(user).to have_at_least(1).errors_on(:email)
  end

  it 'cant have a small password' do
    user = FactoryGirl.build(:user, password: 'aaaaa')

    expect(user).to have_at_least(1).errors_on(:password)
  end

  it 'has a unique email address' do
    FactoryGirl.create(:user, email: 'a@A.com')
    user2 = FactoryGirl.build(:user, email: 'A@a.com')

    expect(user2).to_not be_valid

  end

end
