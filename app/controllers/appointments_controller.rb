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
    charge_description = ChargeDescription.find(params[:charge_description][:id]) if params[:charge_description]
    payment = Payment.new(params[:payment]) if params[:payment]
    
    @appointment.charges << charge_description.new_charge unless charge_description.nil?
    @appointment.payments << payment unless payment.nil?
    
    redirect_to appointment_path(@appointment)
  end
end