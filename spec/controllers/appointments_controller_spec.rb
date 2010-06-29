require 'spec_helper'

describe AppointmentsController do
  
  integrate_views
  
  it "should list all appointments" do
    Appointment.create(:owner => 'Dave', :patient => 'fluffy')
    Appointment.create(:owner => 'John', :patient => 'rex')
    
    get :index
    
    assert_match /Dave.*fluffy/, response.body
    assert_match /John.*rex/, response.body
  end
  
  it "should create a new appointment and display it on the index page" do
    
    post :create, "appointment"=>{"patient"=>"fluffy", "owner"=>"dave"}
    
    assert_redirected_to appointments_path
    
    appointment = Appointment.find_by_patient("fluffy")
    assert_not_nil appointment
    assert_equal "fluffy", appointment.patient
    assert_equal "dave", appointment.owner
  end
  
  it "should show a specific appointment" do
    appointment = Appointment.create(:owner => 'Dave', :patient => 'fluffy')
    appointment.charges << ChargeDescription.create(:treatment => "Rabies shot", :cost => 50.0).new_charge
    appointment.payments << Payment.new(:amount => 20.0)
    
    get :show, :id => appointment.id
    
    assert_match /Dave/, response.body
    assert_match /fluffy/, response.body
    assert_match /Rabies shot.*50.00/, response.body
    assert_match /Payment.*20.00/, response.body
    assert_match /Total Due.*30.00/, response.body
  end
  
  it "should update an appointment with a charge" do
    appointment = Appointment.create(:owner => 'Dave', :patient => 'fluffy')
    charge_description = ChargeDescription.create(:treatment => "Rabies shot", :cost => 50.0)
    
    put :update, :id => appointment.id, :charge_description => {:id => charge_description.id}
    
    assert_redirected_to appointment_path(appointment)
    assert_equal 1, appointment.charges.size
  end
  
  it "should update an appointment with a payment" do
    appointment = Appointment.create(:owner => 'Dave', :patient => 'fluffy')
    
    put :update, :id => appointment.id, :payment_amount => "200"
    
    assert_redirected_to appointment_path(appointment)
    assert_equal 1, appointment.payments.size
    assert_equal 200.0, appointment.payments.first.amount
  end
end