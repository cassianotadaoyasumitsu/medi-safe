class UsersController < ApplicationController
  def index
    @users = current_user.nurses
  end
end
