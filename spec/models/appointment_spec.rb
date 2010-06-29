require 'spec_helper'

describe Appointment do
  
  let(:appointment) { Appointment.create(:owner => 'Dave Atkins', :patient => 'Fluffy') }

  it "can be created with an owner and patient" do
    assert_equal 'Dave Atkins', appointment.owner
    assert_equal 'Fluffy', appointment.patient
  end
  
  it "can add charges" do
    description = ChargeDescription.create(:treatment => 'Rabies shot', :cost => 50.0 )
    charge = Charge.new(:charge_description => description, :cost => 50.0)
    
    appointment.charges << charge
    
    assert_equal 1, appointment.charges.size
    assert_equal charge, appointment.charges.first
    assert_equal appointment, charge.appointment
  end
  
  it "can add payments" do
    appointment.payments << Payment.new(:amount => 10.0)
    
    assert_equal 1, appointment.payments.count
    assert_equal 10.0, appointment.payments.first.amount
  end
  
  it "can calculate total due" do
    assert_equal 0, appointment.total_due
    
    appointment.charges << ChargeDescription.create(:treatment => 'Rabies shot', :cost => 50.0 ).new_charge
    
    assert_equal 50.0, appointment.total_due
    
    appointment.payments << Payment.new(:amount => 30.0)
    
    assert_equal 20.0, appointment.total_due
    
    appointment.payments << Payment.new(:amount => 20.0)
    
    assert_equal 0, appointment.total_due
  end
end