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
end