# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# vehicles = Vehicle.create([{make: 'Ford',model: 'Explorer', yr: '2000', mpg: 23},{make: 'Mazda',model: 'X5', yr: '2016',mpg: 34 }])

Place.create!([
    { "name": "Buckingham Palace", "latitude": "51.501564","longitude": "-0.141944"},
    { "name": "Westminster Abbey", "latitude": "51.499581", "longitude": "-0.127309"},
    { "name": "Big Ben", "latitude": "51.500792", "longitude": "-0.124613"}
    ])

Place.create!([{ "name": "Courtyard by Marriot Los Angeles Westside", "street": "6333 Bristol Pkwy", "city": "Culver City", "state": "CA", "zip": "90230" }])