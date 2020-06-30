

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Federation.destroy_all

Affiliation.destroy_all
Division.destroy_all
Registration.destroy_all

Competition.destroy_all
Federation.destroy_all
CompetitionDivision.destroy_all

light = Division.create!(name: 'light')
middle = Division.create!(name: 'middle')
heavy = Division.create!(name: 'heavy')

fjjrio = Federation.create!(email: 'fjjrio@gmail.com',
                  password: '123456')

rio_open = Competition.create!(name: 'Rio Open',
                              address: 'Tijuca Tênis Clube',
                              federation: fjjrio,
                              date: Date.new(2020,7,30),
                              description: 'O mais tradicional do Rio',
                              prize: 500,
                              registration_deadline: Date.new(2020,7,15),
                              registration_price: 50)

CompetitionDivision.create!(competition: rio_open,
                            division: light)
CompetitionDivision.create!(competition: rio_open,
                            division: middle)
CompetitionDivision.create!(competition: rio_open,
                            division: heavy)
