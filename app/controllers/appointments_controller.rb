class AppointmentsController < ApplicationController
  
  def index
    @appointments = Appointment.all
  end
  
  def create
    Appointment.create(params[:appointment])
    
    redirect_to appointments_path
  end
  
  def show
    @appointment = Appointment.find(params[:id])
  end
  
end