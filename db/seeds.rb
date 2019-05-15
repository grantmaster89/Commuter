require Rails.root.join 'spec/seed_data_helper'
extend SeedData

# Place.create!([
#     { "name": "Buckingham Palace", "latitude": "51.501564","longitude": "-0.141944"},
#     { "name": "Westminster Abbey", "latitude": "51.499581", "longitude": "-0.127309"},
#     { "name": "Big Ben", "latitude": "51.500792", "longitude": "-0.124613"}
#     ])

# Place.create!([{ "name": "Courtyard by Marriot Los Angeles Westside", "street": "6333 Bristol Pkwy", "city": "Culver City", "state": "CA", "zip": "90230" }])

Place.create!([{ "name": "Home", "street": "11655 Iowa Ave", "city": "Los Angeles", "state": "CA", "zip": "90025" }])