class PatientsController < ApplicationController

  def show
    @patient = Patient.find(params[:id])
    @doctor = @patient.doctor
    @tasktemplates = TaskTemplate.where(patient: @patient)
  end

  def index
    @patients = current_user.patients.uniq
  end
end
