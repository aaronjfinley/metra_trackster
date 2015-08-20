class CreateArrivals < ActiveRecord::Migration
  def change
    create_table :arrivals do |t|
      t.integer :train_id
      t.integer :platform

      t.timestamps

    end
  end
end
