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
    
    get :show, :id => appointment.id
    
    assert_match /Dave/, response.body
    assert_match /fluffy/, response.body
    assert_match /Rabies shot.*50.00/, response.body
  end
  
end