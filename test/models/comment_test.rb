require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = User.create(
              first_name: 'John',
              last_name: 'Jack',
              email: 'john@example.com',
              password: 'pass1234',
              password_confirmation: 'pass1234'
            )
    @post = @user.posts.new(title: 'Test Title', description: 'Test Description')
  end

  test 'valid comment' do
    comment = @post.comments.new(comment: 'Comment', commentor_id: @user.id)
    assert comment.valid?
  end

  test 'invalid without comment' do
    comment = @post.comments.new(commentor_id: @user.id)
    refute comment.valid?, 'comment is valid without a title'
    assert_not_nil comment.errors[:title], 'no validation error for title present'
  end
end
