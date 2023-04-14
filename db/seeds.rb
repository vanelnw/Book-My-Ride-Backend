# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

car1 = Car.create(make: "Toyota", model: "Corolla", year: 2018, user_id: 1, image: "https://st2.depositphotos.com/3037725/45775/i/600/depositphotos_457759302-stock-photo-tula-russia-february-2021-toyota.jpg", 
            daily_rate: 2500, description: "The Toyota Corolla is a reliable and stylish compact sedan that is perfect for daily commutes or longer road trips. This 2018 model features a sleek exterior design that is both sporty and refined, and its interior is spacious and comfortable. With a daily rental rate of 2500, you can enjoy all the benefits of this well-rounded vehicle without breaking the bank.")
car2 = Car.create(make: "Honda", model: "Civic", year: 2019, user_id: 1, image: "https://images.hgmsites.net/lrg/2020-honda-civic-sport-manual-angular-front-exterior-view_100751892_l.jpg",
            daily_rate: 2000, description: "The Honda Civic is a popular and versatile compact car that offers excellent performance, fuel efficiency, and safety features. This 2019 model boasts a striking exterior design that is sure to turn heads, and its comfortable and well-equipped interior makes it a joy to drive. At a daily rental rate of 2000, you can experience the quality and reliability of this top-rated vehicle without having to make a long-term commitment.")
Reservation.create(reservation_date: "2023-04-10", user_id: 1, car_id: car1.id, due_date: "2023-04-12")
Reservation.create(reservation_date: "2023-04-14", user_id: 1, car_id: car2.id, due_date: "2023-04-16")