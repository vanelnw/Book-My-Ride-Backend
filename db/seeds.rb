# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Create user
user_params = { name: 'Tony Zia', email: 'tonyzia@gmail.com', password: '12345678', password_confirmation: '12345678' }
user = User.create(user_params)

# Create cars
cars_params = [
  { name: 'Mercedes Model S', car_type: 'mercedesE-class', description: 'the fastest car in the market', image: 'https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGNhcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', brand: 'Mercedes', daily_rate: 2000 },
  { name: 'Mercedes Model G', car_type: 'mercedesG-class', description: 'the fastest car on land in the market', image: 'https://images.unsplash.com/photo-1629020607902-3a93e9f8c4b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bWVyY2VkZXMlMjBiZW56fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60', brand: 'Mercedes', daily_rate: 3000 },
  { name: 'Mustang Model X', car_type: 'mustang-ecoboost', description: 'the fastest car ever made', image: 'https://images.unsplash.com/photo-1547744152-14d985cb937f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', brand: 'Mustang', daily_rate: 2000 },
  { name: 'Tesla Model Z', car_type: 'sportscar', description: 'the fastest sportscar in the market', image: 'https://images.unsplash.com/photo-1617788138017-80ad40651399?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=8000', brand: 'Tesla', daily_rate: 2500 }
]
cars = Car.create(cars_params)

# Create reservation
reservation_params = { reservation_date: '04-05-2023', due_date: '06-05-2023', user_id: user.id, car_id: cars.first.id }
Reservation.create(reservation_params)
