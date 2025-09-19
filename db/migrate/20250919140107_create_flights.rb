class CreateFlights < ActiveRecord::Migration[8.0]
  def change
    create_table :flights do |t|
      t.integer :flight_duration
      t.date :start_date
      t.time :start_time
      t.references :departure_airport, null: false, foreign_key: { to_table: :airports}
      t.references :arrival_airport, null: false, foreign_key: { to_table: :airports}

      t.timestamps
    end
  end
end
