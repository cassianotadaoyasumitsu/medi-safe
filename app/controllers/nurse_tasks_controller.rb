class NurseTasksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @nurse_tasks = NurseTask.where(user: current_user).order(:position)
  end

  def sort
    params[:nurse_tasks].each_with_index do |id, index|
      NurseTask.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end
end
