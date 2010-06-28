class CreateCharge < ActiveRecord::Migration
  def self.up
    create_table :charges do |t|
      t.integer :charge_description_id
      t.decimal :cost, :precision => 6, :scale => 2
      t.integer :appointment_id
      t.timestamps
    end
  end

  def self.down
    drop_table :charges
  end
end
