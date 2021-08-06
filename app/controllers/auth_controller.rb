class AuthController < ApplicationController
  before_action :load_user_by_email, only: :sign_in
  skip_before_action :authenticate_token, only: [:sign_in, :sign_up]

  def sign_in
    if @user.present? and @user.authenticate params[:password]
      generate_token_and_reponse

    else
      render_error("Invalid email or password")
    end
  end

  def sign_up
    @user = User.create!(sign_up_params)
    generate_token_and_reponse
  end

  def sign_out
    current_user.update api_token: nil
    render json: { sucess: true }, status: 200
  end

  private
    def load_user_by_email
      @user = User.find_by_email(params[:email])
    end

    def generate_token_and_reponse
      token = @user.generate_access_token
      render json: @user, serializer: ::UserSerializer::Base, meta: { token: token }, adapter: :json
    end

    def sign_up_params
      params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
