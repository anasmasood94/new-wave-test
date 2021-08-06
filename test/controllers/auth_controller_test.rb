class AuthControllerTest < ActionController::TestCase
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

  test 'sign in successfully' do
    post :sign_in, params: { email: 'john@example.com', password: 'pass1234' }
    assert_response :success
  end

  test 'sign in with wrong password does not work' do
    post :sign_in, params: { email: 'john@example.com', password: 'pass123' }
    assert_response 422
  end

  test 'sign up successfully' do
    post :sign_up, params: {
        email: 'user@example.com',
        password: 'pass1234',
        password_confirmation: 'pass1234',
        first_name: 'Jhon',
        last_name: 'user'
      }
    assert_response :success
  end

  test 'sign out successfully' do
    post :sign_out
    assert_response :success
  end
end
