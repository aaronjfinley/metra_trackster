class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.time :arrives_at
      t.string :line

      t.timestamps

    end
  end
end
