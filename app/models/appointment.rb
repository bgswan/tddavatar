class Appointment < ActiveRecord::Base
  
  has_many :charges
  has_many :payments
  
  def total_due
    charges.sum(:cost) - payments.sum(:amount)
  end
end