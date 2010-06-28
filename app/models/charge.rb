class Charge < ActiveRecord::Base
  
  belongs_to :charge_description
  belongs_to :appointment
  
  delegate :treatment, :to => :charge_description
end