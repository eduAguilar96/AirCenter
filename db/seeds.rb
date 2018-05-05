# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  name: "Alfonse",
  last_name_p: "Elric",
  last_name_m: Null,
  mail: "aelric@alch.net",
  telephone: "123457890",
  birth_date: "1995-05-04",
  passport: "34893"
)
