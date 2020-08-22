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
<<<<<<< HEAD
    # Work with patient with High Care
    @nurses = User.where(leader_id: current_user.id)
    ["High Care", "Medium Care", "Low Care"].each do |care_level|
      @patients = Patient.where(severity: care_level)
      @patients.each_with_index do |patient, index|
        Notification.create(recipient: @user, actor: current_user, action: "assigned", notifiable: patient)
        patient.task_templates.each do |task_template|
          new_task_template.frequency.times do
            task_template.nurse_tasks.create(user_id: @nurses[index % @nurses.count].id, slot: [8,12].sample, completed: false)
          end
        end
      end
    end
    current_user.on_shift = true
    current_user.save
    redirect_to users_path
  end

  private

  def leader?
    redirect_to users_path if current_user.nurses.count > 1
  end
end
