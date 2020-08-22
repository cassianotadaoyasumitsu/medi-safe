class NurseTasksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    set_index_variables!
  end

  def sort
    # Start time should be 8AM + duration of completed tasks (for example)
    start_time = Time.parse("8:00")
    params[:nurse_tasks_morning].each_with_index do |id, index|
      current_task = NurseTask.find(id)
      current_task.update(slot: 8, position: index + 1, start_time: start_time)
      start_time = start_time + (current_task.task_template.task.duration * 60)
    end
    # consider 1 hour lunch break
    start_time = start_time + (60 * 60)
    params[:nurse_tasks_afternoon].each_with_index do |id, index|
      current_task = NurseTask.find(id)
      current_task.update(slot: 12, position: index + 1, start_time: start_time)
      start_time = start_time + (current_task.task_template.task.duration * 60)
    end

    set_index_variables!
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

  def set_index_variables!
    @nurse_tasks = NurseTask.where(user: current_user)
    if @nurse_tasks.first.position
      @nurse_tasks = @nurse_tasks.order(:position)
    else
      @nurse_tasks = @nurse_tasks.order(:id)
    end
    @active_task = NurseTask.where(user: current_user, active: true)[0]
    if @active_task.nil?
      @active_task = @nurse_tasks.where(slot: 8).first
      @active_task.active = true
      @active_task.save
    end
    @incomplete_morning_tasks = @nurse_tasks.where(slot: 8, completed: false)
    @incomplete_afternoon_tasks = @nurse_tasks.where(slot: 12, completed: false)
    @completed_morning_tasks = @nurse_tasks.where(slot: 8, completed: true)
    @completed_afternoon_tasks = @nurse_tasks.where(slot: 12, completed: true)
  end
end
