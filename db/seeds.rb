# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(firstname:  "Eric",
             lastname: "Stephenson",
             email: "ericb.stephenson@gmail.com",
             business: "Alekson Group",
             phone: "999-888-7777",
             password:              "Griffen2015!",
             password_confirmation: "Griffen2015!",
             admin: true)
             