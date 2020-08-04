class PatientsController < ApplicationController
  def index
    nurse_tasks = current_user.nurse_tasks
    @patients = tasks.flat_map { |task| Patient.where(nurse_tasks: task) }
  end
end
