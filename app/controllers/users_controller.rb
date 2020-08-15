class UsersController < ApplicationController
  def index
    @nurses = current_user.nurses.includes(:patients, :nurse_tasks)
  end

  def show
    @user = User.find(params[:id])
  end
end
