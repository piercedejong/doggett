# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

v = Voter.create([
    {name: "Voter A", email:"voterA@gmail.com", phone:"123 456 1234", address:"123 3rd ST", user_id: User.first.id},
    {name: "Voter B", email:"voterB@aol.com", phone:"555 555 5555", address:"123234 3rd ST", user_id: User.first.id},
    {name: "Voter C", email:"voterC@yahoo.com", phone:"111 111 1111", address:"456 3rd ST", user_id: User.first.id},
    {name: "Voter D", email:"voterD@gmail.com", phone:"512 555 7896", address:"123 3rd ST", user_id: User.first.id},
    {name: "Voter E", email:"voterA@gmail.com", phone:"512 555 9999", address:"678 3rd ST", user_id: User.first.id},
    {name: "Voter 3", email:"voter3@gmail.com", phone:"512 555 1223", address:"834567 3rd ST", user_id: User.first.id},
    {name: "Voter F", email:"voterF@gmail.com", phone:"512 555 4444", address:"345 3rd ST", user_id: User.first.id},
    {name: "Voter G", email:"voterG@gmail.com", phone:"512 555 7654", address:"123 3rd ST", user_id: User.first.id},
    {name: "Voter H", email:"voterH@gmail.com", phone:"512 555 9182", address:"78 3rd ST", user_id: User.first.id},
    {name: "Voter I", email:"voterI@gmail.com", phone:"512 555 3456", address:"12334 3rd ST", user_id: User.first.id},
    ])
