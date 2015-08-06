class ApplicationController < ActionController::API

  private

    def auth_token
      @auth_token = request.headers.env['HTTP_AUTH_TOKEN']
    end

    def current_user
      @current_user ||= User.find_by(auth_token: auth_token)
    end

    def authenticate_with_token!
      render json: {errors: 'Not authenticated'}, status: :unauthorized if current_user.nil?
    end

end
