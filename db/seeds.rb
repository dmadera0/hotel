# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Reservation.destroy_all
Guest.destroy_all


standard_room = Room.create(bed: 1, name: "Standard", price: 100)
delux_room = Room.create(bed: 2, name: "Delux", price: 200)
suite_room = Room.create(bed: 2, name: "Suite", price: 300)

daniel = Guest.create(username: "Daniel", party_size: 1, password: "1234")

Reservation.create(checkin_date:"09-27-2020",checkout_date: "09-30-2020", room: standard_room, guest: daniel)

