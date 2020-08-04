class PatientsController < ApplicationController
  def index
    @patients = current_user.nurse_tasks.flat_map { |task| task.task_template.patient }.uniq
  end
end
