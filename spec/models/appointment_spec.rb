require 'spec_helper'

describe Appointment do
  
  it "can be created with an owner and patient" do
    appointment = Appointment.create(:owner => 'Dave Atkins', :patient => 'Fluffy')
    
    assert_equal 'Dave Atkins', appointment.owner
    assert_equal 'Fluffy', appointment.patient
  end
end