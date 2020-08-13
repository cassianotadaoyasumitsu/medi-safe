class UsersController < ApplicationController
  def index
    @users = current_user.nurses.includes(:patients)
  end
end
