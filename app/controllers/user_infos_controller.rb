class UserInfosController < ApplicationController
  before_action :authenticate_user!
  before_action :auth_admin, except: [:profile]

  def profile
    @user = current_user
  end

  def index
    @users = User.all.order(:id)
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_info_params)
      flash[:notice] = t(:saved_successfuly)
      redirect_to user_infos_path
    else
      Rails.logger.info(@user.errors.to_json)
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = t(:deleted_successfuly)
    redirect_to user_infos_path
  end

  private

  def user_info_params
    params.require(:user).permit(:full_name,
                                 :preferred_name,
                                 :phone,
                                 :city,
                                 :comment,
                                 :source,
                                 :is_student,
                                 :is_mentor,
                                 :is_mentor_view,
                                 :is_admin)
  end
end
