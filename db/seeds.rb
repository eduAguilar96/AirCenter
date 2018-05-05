# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(
  name: "Bruce",
  last_name_p: "Wayne",
  last_name_m: "Kane",
  mail: "batman@gmail.com",
  telephone: "666",
  birth_date: "2000-1-1",
  passport: "12345"
)
User.create(
  name: "Peter",
  last_name_p: "Parker",
  mail: "spiderman@gmail.com",
  telephone: "555",
  birth_date: "2000-1-1",
  passport: "1520978"
)
User.create(
  name: "Scott",
  last_name_p: "Pilgrim",
  last_name_m: "Flowers",
  mail: "scott@gmail.com",
  telephone: "777",
  birth_date: "2000-1-1",
  passport: "7867589"
)

flight_1 = Flight.create(
  day: Date.today,
  departure_time: Time.now,
  arrival_time: Time.now,
  origin: "Monterrey",
  destination: "San Fransisco"
)
Flight.create(
  day: Date.today,
  departure_time: Time.now,
  arrival_time: Time.now,
  origin: "Monterrey",
  destination: "DF"
)
Flight.create(
  day: Date.today,
  departure_time: Time.now,
  arrival_time: Time.now,
  origin: "Monterrey",
  destination: "Cancun"
)

ReservationInformation.create(
  flight_id: flight_1.id,
  user_id: user.id,
  available_tickets: 50,
  flight_type: 0,
  capacity: 50,
)

Ticket.create(
  flight_id: flight_1.id,
  user_id: user.id,
  seat: "A1",
  cost: 1000,
  zone: "7"
)
