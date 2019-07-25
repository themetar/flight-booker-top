# REMOVE PREVIOUS
Airport.delete_all
Flight.delete_all

# Airports
["NYC", "SFO", "LHR", "CDG", "BER"].each do |airport_code|
  Airport.create(code: airport_code)
end

# Flights
airports = Airport.all
500.times do
  from = airports.sample
  to   = (airports - [from]).sample
  date = rand(4).days.from_now + rand(23).hours + rand(60).minutes
  duration = rand(10).hours

  Flight.create(from_airport_id: from.id,
                to_airport_id: to.id,
                departure: date,
                duration: duration)
end
