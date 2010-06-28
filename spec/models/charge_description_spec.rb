require 'spec_helper'

describe ChargeDescription do
  
  it "can be created with a treatment and cost" do
    description = ChargeDescription.create(:treatment => 'Rabies Shot', :cost => '50.0')
    
    assert_equal 'Rabies Shot', description.treatment
    assert_equal 50.0, description.cost
  end
  
  it "can create a charge"
end