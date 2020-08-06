class PatientsController < ApplicationController

  def show
    @patient = Patient.find(params[:id])
  end

  def index
    @patients = current_user.patients.uniq
  end
end
