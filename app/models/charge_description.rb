class ChargeDescription < ActiveRecord::Base
  
  def new_charge
    Charge.new(:charge_description => self, :cost => self.cost)
  end
end