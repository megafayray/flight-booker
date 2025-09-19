# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


#Create Airports:
  ["YYZ", "YUL", "YVR", "YYC", "YOW"].each do |airport_code|
    Airport.find_or_create_by!(code: airport_code)
  end

#Create flights:
Airport.find_each do |departure_airport|
  # Pick 2 random arrival airports that are not the same as the departure airport
  arrival_airports = Airport.where.not(id: departure_airport.id).sample(2)

  # Create 2 flights
  2.times do |i|
    Flight.create!(
      departure_airport: departure_airport,
      arrival_airport: arrival_airports[i],
      flight_duration: rand(60..300), # 1 to 5 hours
      start_date: Date.today + i.days,
      start_time: Time.now.change(hour: 8 + i * 2, min: 0) # 8AM, 10AM, etc.
    )
  end
end