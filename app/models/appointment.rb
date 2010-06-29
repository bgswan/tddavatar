class Appointment < ActiveRecord::Base
  
  has_many :charges
  has_many :payments
end