require 'faker'

Affiliation.destroy_all
Registration.destroy_all
CompetitionDivision.destroy_all
Division.destroy_all
Competition.destroy_all
Federation.destroy_all
User.destroy_all

puts 'Creating users...'

pedro = User.create!(first_name: 'Pedro',
                    last_name: 'Fontes',
                    date_of_birth: Date.new(2003,1,30),
                    nationality: 'BR',
                    gender: 'Male',
                    email: 'pedrof@gmail.com',
                    password: '123456')

camila = User.create!(first_name: 'Camila',
                    last_name: 'Silva',
                    date_of_birth: Date.new(1995,5,20),
                    nationality: 'BR',
                    gender: 'Female',
                    email: 'camilas@gmail.com',
                    password: '123456')

rez = User.create!(first_name: 'Rezwan',
                    last_name: 'Iqbal',
                    date_of_birth: Date.new(1995,6,10),
                    nationality: 'ROM',
                    gender: 'Male',
                    email: 'rezwani@gmail.com',
                    password: '123456')

nuno = User.create!(first_name: 'Nuno',
                    last_name: 'Lei',
                    date_of_birth: Date.new(1995,7,5),
                    nationality: 'PT',
                    gender: 'Male',
                    email: 'nunol@gmail.com',
                    password: '123456')

puts 'Creating divisions...'

male_juvenile_rooster = Division.create!(name: 'male juvenile rooster weight')
male_juvenile_light = Division.create!(name: 'male juvenile light weight')
male_juvenile_middle = Division.create!(name: 'male juvenile middle weight')
male_juvenile_heavy = Division.create!(name: 'male juvenile heavy weight')
male_juvenile_open_class = Division.create!(name: 'male juvenile open class')

male_adult_rooster = Division.create!(name: 'male adult rooster weight')
male_adult_light = Division.create!(name: 'male adult light weight')
male_adult_middle = Division.create!(name: 'male adult middle weight')
male_adult_heavy = Division.create!(name: 'male adult heavy weight')
male_adult_open_class = Division.create!(name: 'male adult open class')

female_juvenile_rooster = Division.create!(name: 'female juvenile rooster weight')
female_juvenile_light = Division.create!(name: 'female juvenile light weight')
female_juvenile_middle = Division.create!(name: 'female juvenile middle weight')
female_juvenile_heavy = Division.create!(name: 'female juvenile heavy weight')
female_juvenile_open_class = Division.create!(name: 'female juvenile open class')

female_juvenile_rooster = Division.create!(name: 'female juvenile rooster weight')
female_juvenile_light = Division.create!(name: 'female juvenile light weight')
female_juvenile_middle = Division.create!(name: 'female juvenile middle weight')
female_juvenile_heavy = Division.create!(name: 'female juvenile heavy weight')
female_juvenile_open_class = Division.create!(name: 'female juvenile open class')

puts 'Creating federations...'

fjjrio = Federation.create!(name: 'FJJRIO',
                            location: 'Rio de Janeiro',
                            affiliation_price: '50',
                            email: 'fjjrio@gmail.com',
                            password: '123456')
 # - Federação de Jiu-Jitsu do Rio

 cbjj = Federation.create!(name: 'CBJJ',
                          location: 'Brazil',
                          affiliation_price: '70',
                          email: 'cbjj@gmail.com',
                          password: '123456')
 # - Confederação Brasileira de Jiu-Jitsu

 fpjjb = Federation.create!(name: 'FPJJ',
                          location: 'Lisbon',
                          affiliation_price: '30',
                          email: 'fpjjb@gmail.com',
                          password: '123456')
 # - Federação Portuguesa de Jiu-Jitsu


sjjsaf = Federation.create!(name: 'SJJSAF',
                          location: 'South America',
                          affiliation_price: '70',
                          email: 'sjjsaf@gmail.com',
                          password: '123456')
 # - Sport Jiu-Jitsu South American Federation

puts 'Creating competitions...'

# FJJRIO

rio_open = Competition.create!(name: 'Rio Open',
                              address: 'Tijuca Tênis Clube',
                              federation: fjjrio,
                              date: Date.new(2020,8,20),
                              description: '',
                              prize: 500,
                              registration_deadline: Date.new(2020,8,13),
                              registration_price: 50)

Division.all.each do |division|
  CompetitionDivision.create!(competition: rio_open, division: division)
end

carlson_gracie = Competition.create!(name: 'Carlson Gracie',
                                    address: 'Tijuca Tênis Clube',
                                    federation: fjjrio,
                                    date: Date.new(2020,9,18),
                                    description: '',
                                    prize: 300,
                                    registration_deadline: Date.new(2020,9,5),
                                    registration_price: 40)

Division.all.each do |division|
  CompetitionDivision.create!(competition: carlson_gracie, division: division)
end

summer_open = Competition.create!(name: 'Summer Open',
                                    address: 'Marina da Glória',
                                    federation: fjjrio,
                                    date: Date.new(2020,12,15),
                                    description: '',
                                    prize: 450,
                                    registration_deadline: Date.new(2020,11,30),
                                    registration_price: 40)

# CBJJ

brasileiro = Competition.create!(name: 'Brasileiro',
                                    address: 'São Paulo',
                                    federation: cbjj,
                                    date: Date.new(2020,10,12),
                                    description: '',
                                    prize: 1000,
                                    registration_deadline: Date.new(2020,10,5),
                                    registration_price: 50)

Division.all.each do |division|
  CompetitionDivision.create!(competition: brasileiro, division: division)
end

brasileiro_kids = Competition.create!(name: 'Brasileiro Kids',
                                    address: 'Marina da Glória',
                                    federation: cbjj,
                                    date: Date.new(2020,10,20),
                                    description: '',
                                    prize: 0,
                                    registration_deadline: Date.new(2020,10,13),
                                    registration_price: 40)

# FPJJB

lisbon_open = Competition.create!(name: 'Lisbon Open',
                                    address: 'Parque das Nações',
                                    federation: fpjjb,
                                    date: Date.new(2021,1,15),
                                    description: '',
                                    prize: 200,
                                    registration_deadline: Date.new(2021,1,5),
                                    registration_price: 40)

# SJJSAF

copa_america = Competition.create!(name: 'Copa America',
                                    address: 'Arena da Juventude',
                                    federation: sjjsaf,
                                    date: Date.new(2020,10,18),
                                    description: '',
                                    prize: 300,
                                    registration_deadline: Date.new(2020,10,4),
                                    registration_price: 30)

rio_challenge = Competition.create!(name: 'Rio Challenge',
                                    address: 'Parque das Nações',
                                    federation: sjjsaf,
                                    date: Date.new(2020,12,5),
                                    description: '',
                                    prize: 200,
                                    registration_deadline: Date.new(2020,11,25),
                                    registration_price: 40)

puts 'Creating fake users...'

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  fake_user = User.create!(first_name: first_name,
                          last_name: last_name,
                          date_of_birth: Faker::Date.between(from: '1980-01-01', to: '2005-01-01'),
                          nationality: Faker::Nation.nationality,
                          gender: Faker::Gender.binary_type,
                          email: Faker::Internet.free_email(name: first_name),
                          password: '123456')
  Affiliation.create!(federation: fjjrio, user: fake_user)
  Registration.create!(competition_division: CompetitionDivision.find_by(competition: rio_open), user: fake_user)
end

puts 'Done 🎉'
