class CreateAppointment < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.string :owner
      t.string :patient
      t.timestamps
    end
  end

  def self.down
    drop_table :appointments
  end
end
