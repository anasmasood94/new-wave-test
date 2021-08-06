class CommentsControllerTest < ActionController::TestCase
  def setup
    @user = User.create(
              first_name: 'John',
              last_name: 'Jack',
              email: 'john@example.com',
              password: 'pass1234',
              password_confirmation: 'pass1234'
            )
    @post = @user.posts.new(title: 'Test Title', description: 'Test Description')
    request.headers['Authorization'] = "Bearer #{@user.generate_access_token}"
  end

  test 'create a comment successfully' do
    post :create, params: { comment: 'Comment', post_id: @post.id, commentor_id: @user.id }
    assert_response :success
  end

  test 'update a comment successfully' do
    comment = @post.comments.create(comment: 'Comment', commentor: @user)

    patch :update, params: { title: 'Comment Update', post_id: @post.id, id: comment.id }
    assert_response :success
  end

  test 'destroy a comment successfully' do
    comment = @post.comments.create(comment: 'Comment', commentor: @user)

    delete :destroy, params: { post_id: @post.id, id: comment.id }
    assert_response :success
  end

  test 'get index' do
    get :index, params: { post_id: @post.id }
    assert_response :success
  end
end
