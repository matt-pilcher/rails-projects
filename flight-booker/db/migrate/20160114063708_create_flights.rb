class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.datetime :date
      t.references :from, index: true
      t.references :to, index: true
      t.integer :duration

      t.timestamps null: false
    end
  end
end
