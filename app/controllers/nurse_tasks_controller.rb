class NurseTasksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @nurse_tasks = NurseTask.where(user: current_user).order(:position)
    @active_task = NurseTask.where(user: current_user, active: true)[0]
    @active_task = @nurse_tasks.where(slot: 8).first if @active_task.nil?
    @incomplete_morning_tasks = @nurse_tasks.where(slot: 8, completed: false)
    @incomplete_afternoon_tasks = @nurse_tasks.where(slot: 12, completed: false)
    @completed_morning_tasks = @nurse_tasks.where(slot: 8, completed: true)
    @completed_afternoon_tasks = @nurse_tasks.where(slot: 12, completed: true)
  end

  def sort
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
    @nurse_task.active = false
    @nurse_task.save
    new_active_task =
      NurseTask.where(user: current_user, slot: 8, completed: false).order(:position)[0] ||
      NurseTask.where(user: current_user, slot: 12, completed: false).order(:position)[0]
    new_active_task.active = true
    new_active_task.save
    redirect_to nurse_tasks_path
  end

  def make_active
    previous_task = NurseTask.where(user: current_user, active: true)[0]
    unless previous_task.nil?
      previous_task.active = false
      previous_task.save
    end
    @nurse_task = NurseTask.find(params[:id])
    @nurse_task.active = true
    @nurse_task.save
    redirect_to nurse_tasks_path
  end

  def update
    nurse_task = NurseTask.find(params[:id])
    nurse_task.update(nurse_task_params)
    redirect_to nurse_tasks_path
  end

  private

  def nurse_task_params
    params.require(:nurse_task).permit(:note)
  end
end
