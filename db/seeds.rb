# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
places = [
  "DistritoFederal",
  "Cancun",
  "Monterrey",
  "Toronto",
  "NewYork",
  "Chiapas",
  "Merida",
  "Berlin",
  "Noruega",
  "Atlantis",
  "Copenhagen",
  "Egypt",
  "Fiji",
  "Russia",
  "Cyka",
  "Blyat",
  "Tokyo",
  "Greenland"
]

def rand_in_range(from, to)
  rand * (to - from) + from
end

def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

places += places + places
places.each do |origin|
  places.each do |destination|
    if origin != destination
      time = rand_time(10.day.ago)
      Flight.create(
        day: time.to_date,
        departure_time: time,
        arrival_time: time + 60*60,
        origin: origin,
        destination: destination,
        capacity: 75,
        base_price: 1200
      )
    end
  end
end
