Federation.destroy_all
Competition.destroy_all

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
