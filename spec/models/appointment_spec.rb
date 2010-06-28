require 'spec_helper'

describe Appointment do
  
  it "can be created with an owner and patient" do
    appointment = Appointment.create(:owner => 'Dave Atkins', :patient => 'Fluffy')
    
    assert_equal 'Dave Atkins', appointment.owner
    assert_equal 'Fluffy', appointment.patient
  end
  
  it "can add charges" do
    appointment = Appointment.create(:owner => 'Dave Atkins', :patient => 'Fluffy')
    charge = Charge.new(:description => 'Rabies shot', :cost => '50.0')
    
    appointment.charges << charge
    
    assert_equal 1, appointment.charges.size
    assert_equal charge, appointment.charges.first
    assert_equal appointment, charge.appointment
  end
end