class UsersController < ApplicationController
  def index
    @nurses = current_user.nurses.includes(:patients, :nurse_tasks)
    @patients = @nurses.map do |nurse|
      Patient.joins(:task_templates).joins(task_templates: :nurse_tasks)
             .where(task_templates: { nurse_tasks: { user: nurse } }).uniq
    end.flatten

    high_care_patients = 0
    medium_care_patients = 0
    low_care_patients = 0
    @patients.each do |patient|
      case patient.severity
      when 'High Care' then high_care_patients += 1
      when 'Medium Care' then medium_care_patients += 1
      when 'Low Care' then low_care_patients += 1
      end
    end

    @high_care_patients = high_care_patients
    @medium_care_patients = medium_care_patients
    @low_care_patients = low_care_patients
  end

  def show
    @user = User.find(params[:id])
  end
end
