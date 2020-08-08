class NurseTasksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @nurse_tasks = NurseTask.where(user: current_user).order(:position)
  end

  def sort
    # params[:nurse_tasks].each_with_index do |id, index|
    #   NurseTask.where(id: id).update_all(position: index + 1)
    # end
    params[:nurse_tasks_8].each_with_index do |id, index|
      NurseTask.where(id: id).update_all(slot: 8, position: index + 1)
    end
    params[:nurse_tasks_12].each_with_index do |id, index|
      NurseTask.where(id: id).update_all(slot: 12, position: index + 1)
    end

    head :ok
  end
end
