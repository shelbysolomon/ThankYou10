class UsersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.create(user_params)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :role, :permission, :email, :company_id)
  end

end
