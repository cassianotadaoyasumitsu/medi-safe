class PatientsController < ApplicationController
  def show
    @patient = Patient.find(params[:id])
    @doctor = @patient.doctor
    @tasktemplates = TaskTemplate.where(patient: @patient)
    @current_tasks = @patient.nurse_tasks.where(updated_at: 24.hours.ago..Time.now)
    @yesterdays_tasks = @patient.nurse_tasks.where(updated_at: 100.hours.ago..24.hours.ago)
  end

  def index
    @patients = current_user.patients.uniq
    @high_care_patients = current_user.patients.where(severity: 'High Care').uniq.count
    @medium_care_patients = current_user.patients.where(severity: 'Medium Care').uniq.count
    @low_care_patients = current_user.patients.where(severity: 'Low Care').uniq.count
  end
end
