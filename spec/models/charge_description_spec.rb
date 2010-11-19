require 'spec_helper'

describe ChargeDescription do
  
  it "can be created with a treatment and cost" do
    description = ChargeDescription.create(:treatment => 'Rabies Shot', :cost => '50.0')
    
    assert_equal 'Rabies Shot', description.treatment
    assert_equal 50.0, description.cost
  end
  
  it "can create a new charge" do
    description = ChargeDescription.create(:treatment => 'Rabies Shot', :cost => '50.0')

    charge = description.new_charge
    
    assert_equal 'Rabies Shot', charge.treatment
    assert_equal 50.0, charge.cost
  end
  
  it "has failing test to check CI" do
    fail 'oh no!!!'
  end
end