# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Competition = Competition.create( name: "Competition of Jiujtsu",
               address: "Rua Marechal Deodoro, 102 Centro, 93220-220-640 Sapucaia do Sul ",
               date: "11",
               description: "Competition of Jiujtsu at Academia do Minotauro",
               prize: 5,
               registration_deadline: date,
               registration_price: 6)
