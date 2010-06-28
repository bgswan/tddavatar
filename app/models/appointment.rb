class Appointment < ActiveRecord::Base
  
  has_many :charges
end