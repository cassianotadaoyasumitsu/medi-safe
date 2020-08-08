class PatientsController < ApplicationController
  def show
    @patient = Patient.find(params[:id])
    @doctor = @patient.doctor
    @tasktemplates = TaskTemplate.where(patient: @patient)
    @current_tasks = @patient.nurse_tasks.where(updated_at: 24.hours.ago..Time.now)
    @yesterdays_tasks = @patient.nurse_tasks.where(updated_at: 48.hours.ago..24.hours.ago)
  end

  def index
    @patients = current_user.patients.uniq
  end
end
