# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Admin.create!(
    email: 'peterdgreat2016@gmail.com',
    password: 'peterdgreat3',
    password_confirmation: 'peterdgreat3',
    name: 'Peter'
)

