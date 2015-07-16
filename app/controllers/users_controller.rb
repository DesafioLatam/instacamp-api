class UsersController < ApplicationController

  def create
    user = User.new(user_params)

    if user.save
      sign_in user, store: false
      render json: user, status: 201
    else
      render json: {errors: "No se puede crear el usuario"}, status: 422
    end
  end

  def destroy
    current_user.delete

    head :no_content
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
