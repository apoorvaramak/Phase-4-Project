# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pet.destroy_all
Shelter.destroy_all

shelter1 = Shelter.create(location: "New York", name: "New York Rescue", capacity: 100)
shelter2 = Shelter.create(location: "Chicago", name: "Chicago Rescue", capacity: 50)
shelter3 = Shelter.create(location: "Los Angeles", name: "LA Rescue", capacity: 75)

Pet.create(breed: "cat", name: "Moose", age: 9, weight: 15, gps_chip: true, shelter_id: shelter1.id)
Pet.create(breed: "dog", name: "Duke", age: 3, weight: 120, gps_chip: false, shelter_id: shelter2.id)
Pet.create(breed: "parakeet", name: "Bob", age: 2, weight: 5, gps_chip: true, shelter_id: shelter1.id)

