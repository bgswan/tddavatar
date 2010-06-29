class AddChargeDescriptions < ActiveRecord::Migration
  def self.up
    ChargeDescription.create(:treatment => 'Rabies Shot', :cost => 50.0)
    ChargeDescription.create(:treatment => 'Routine Check', :cost => 250.0)
  end

  def self.down
    ChargeDescription.delete_all
  end
end
