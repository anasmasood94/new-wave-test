class ApplicationController < ActionController::API
  before_action :authenticate_token

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  protected
    def authenticate_token
      render json: { error: "Invalid Token" }, status: 401 if authorization_token.nil? or current_user.nil?
    end

    def current_user temp=false
      @current_user ||= User.find_by(api_token: authorization_token)
    end

    def authorization_token
      request&.headers["Authorization"]&.split("Bearer ")&.last
    end

    def render_error message, status=422
      render json: { sucess: false, message: message }, status: status
    end

    def render_success
      render json: { success: true }, status: 200
    end


  private
    def render_unprocessable_entity(e)
      render json: { sucess: false, message: e.record.errors.full_messages.first }, status: 422
    end
end
