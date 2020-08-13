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
  end

  def patient_assignment
    @patients = Patient.all
    @nurses = User.all
  end

  def create_patient_assignment
    @user = User.find(params[:user_id])
    @patients = Patient.where(id: params[:patient_ids])
    @patients.each do |patient|
      patient.task_templates.each do |task_template|
        task_template.nurse_tasks.create(user_id: @user.id, slot: 0)
      end
    end
    redirect_to patient_assignment_path
  end
end
