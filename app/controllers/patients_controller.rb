class PatientsController < ApplicationController
  before_action :leader?, only: :index
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

  def patient_assignment
    @patients = Patient.all
    @nurses = User.where(leader_id: current_user.id)
  end

  def create_patient_assignment
    @user = User.find(params[:user_id])
    @patients = Patient.where(id: params[:patient_ids])
    @patients.each do |patient|
      patient.task_templates.each do |task_template|
        task_template.nurse_tasks.create(user_id: @user.id, slot: 8, completed: false)
      end
    end
    redirect_to patient_assignment_path
  end

  private

  def leader?
    redirect_to patient_assignment_path if current_user.nurses.count > 1
  end
end
