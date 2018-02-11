class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :auth_admin, only: [:list]

  def profile
    @user = current_user
  end

  def list
    @users = User.all.order(:id)
  end
end
