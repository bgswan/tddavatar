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
  
  def update
    @appointment = Appointment.find(params[:id])
    charge_description = ChargeDescription.find(params[:charge_description][:id])
    
    @appointment.charges << charge_description.new_charge
    
    redirect_to appointment_path(@appointment)
  end
end