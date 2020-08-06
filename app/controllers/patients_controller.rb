class PatientsController < ApplicationController
  def index
    @patients = current_user.patients.uniq
  end
end
