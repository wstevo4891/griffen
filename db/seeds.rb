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
             admin: true,
             reset_password_token: "",
             reset_password_sent_at: "",
             remember_created_at: "",
             sign_in_count: 0,
             current_sign_in_at: "",
             last_sign_in_at: "",
             current_sign_in_ip: "",
             last_sign_in_ip: "",
             confirmation_token: "",
             confirmed_at: "",
             confirmation_sent_at: "",
             unconfirmed_email: "",
             failed_attempts: 0,
             unlock_token: "",
             locked_at: "")
             






