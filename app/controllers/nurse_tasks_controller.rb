class NurseTasksController < ApplicationController
  def index
    @nurse_tasks = NurseTask.where(user: current_user)
  end
end
