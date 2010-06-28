class CreateChargeDescription < ActiveRecord::Migration
  def self.up
    create_table :charge_descriptions do |t|
      t.string :treatment
      t.decimal :cost, :precision => 6, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :charge_descriptions
  end
end
