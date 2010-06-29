class CreatePayment < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.decimal :amount, :precision => 6, :scale => 2
      t.integer :appointment_id
      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
