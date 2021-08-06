class PostsControllerTest < ActionController::TestCase
  def setup
    @user = User.create(
              first_name: 'John',
              last_name: 'Jack',
              email: 'john@example.com',
              password: 'pass1234',
              password_confirmation: 'pass1234'
            )
    request.headers['Authorization'] = "Bearer #{@user.generate_access_token}"
  end

  test 'create a post successfully' do
    post :create, params: { title: 'Post title', description: 'Post description' }
    assert_response :success
  end

  test 'update a post successfully' do
    user_post = @user.posts.create(title: "Title", description: "description")

    patch :update, params: { title: 'Title 1', id: user_post.id }
    assert_response :success
  end

  test 'destroy a post successfully' do
    user_post = @user.posts.create(title: "Title", description: "description")

    delete :destroy, params: { id: user_post.id }
    assert_response :success
  end

  test 'get index' do
    get :index
    assert_response :success
  end
end
