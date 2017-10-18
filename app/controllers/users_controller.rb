class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :auth_admin, only: [:index]

  def profile
    @user = current_user
  end

  def index
    @users = User.all
  end
end
