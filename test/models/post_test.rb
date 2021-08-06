require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.create(
              first_name: 'John',
              last_name: 'Jack',
              email: 'john@example.com',
              password: 'pass1234',
              password_confirmation: 'pass1234'
            )
  end

  test 'valid post' do
    post = @user.posts.new(title: 'Test Title', description: 'Test Description')
    assert post.valid?
  end

  test 'invalid without title' do
    post = @user.posts.new(description: 'Test Description')
    refute post.valid?, 'post is valid without an title'
    assert_not_nil post.errors[:title], 'no validation error for title present'
  end
end
