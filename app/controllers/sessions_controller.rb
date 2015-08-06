class SessionsController < ApplicationController
  before_action :authenticate_with_token!, except: [:create]

  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]

    unless user_email.present? and user_password.present?
      render json: {errors: "Invalid parameters, session[email] and session[password] should be present"}, status: :unprocessable_entity
    else
      user = User.find_by(email: user_email)

      if user.nil?
        render json: {errors: "Invalid email"}, status: :forbidden
      elsif user.valid_password? user_password
        sign_in user, store: false
        user.generate_authentication_token!
        user.save
        render json: user, status: :ok
      else
        render json: {errors: "Invalid Password Stupid!"}, status: :forbidden
      end
    end
  end

  def destroy
    user = User.find_by(auth_token: @auth_token)
    user.generate_authentication_token!
    user.save
    head :no_content
  end

  def show_current_user
    render json: current_user
  end

end
