# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

property = Property.create(title:'Casa na praia', property_location:'São Vicente - SP',
                            area:'100', description:'Lalala', daily_rate:100,
                            rooms:2, minimum_rent_days:5,
                            maximum_rent_days:10, photo:'/mi.jpg',
                            maximum_occupancy:20, usage_rules:'no dogs',
                            property_type:'Casa da praia')
