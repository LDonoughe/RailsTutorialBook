# spec/models/post_spec.rb
require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { FactoryGirl.build :post }
  subject { post }

  it 'requires a title' do
    post = FactoryGirl.build(:post, title: '     ')

    expect(post).to have_at_least(1).errors_on(:title)
  end

  it 'requires a body' do
    post = FactoryGirl.build(:post, body: '     ')

    expect(post).to have_at_least(1).errors_on(:body)
  end

end