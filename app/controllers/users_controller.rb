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
    @patients = @user.patients.uniq
    @high_care_patients = @user.patients.where(severity: 'High Care').uniq.count
    @medium_care_patients = @user.patients.where(severity: 'Medium Care').uniq.count
    @low_care_patients = @user.patients.where(severity: 'Low Care').uniq.count
  end

  def help
    new_help = Help.new
    new_help.save
    Notification.create(recipient: current_user.leader, actor: current_user, action: "requested", notifiable: new_help)
  end
end
