class UsersController < ApplicationController
  def index
    @nurses = current_user.nurses.includes(:patients, :nurse_tasks)
  end

  def show
    @nurse = current_user.nurses.find_by(params[:leader_id])
    @user = User.find(params[:id])
  end
end
