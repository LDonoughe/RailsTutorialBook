# postscontroller_spec.rb
require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  it 'does not post when no user is logged in' do
    post = FactoryGirl.build(:post)
    if logged.in? do
      log_out
    end
    expect(post :create, post: post).to raise_error
  end
end