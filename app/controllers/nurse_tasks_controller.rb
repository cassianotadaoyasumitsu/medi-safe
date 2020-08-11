class NurseTasksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @nurse_tasks = NurseTask.where(user: current_user).order(:position)
  end

  def sort
    # params[:nurse_tasks].each_with_index do |id, index|
    #   NurseTask.where(id: id).update_all(position: index + 1)
    # end
    params[:nurse_tasks_morning].each_with_index do |id, index|
      NurseTask.where(id: id).update_all(slot: 8, position: index + 1)
    end
    params[:nurse_tasks_afternoon].each_with_index do |id, index|
      NurseTask.where(id: id).update_all(slot: 12, position: index + 1)
    end

    head :ok
  end

  def complete
    @nurse_task = NurseTask.find(params[:format])
    @nurse_task.completed = true
    @nurse_task.save
    redirect_to nurse_tasks_path
  end
end
