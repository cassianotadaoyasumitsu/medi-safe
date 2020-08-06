class PatientsController < ApplicationController

  def show
    @patient = Patient.find(params[:id])
    @doctor = @patient.doctor
  end

  def index
    @patients = current_user.patients.uniq
  end
end
