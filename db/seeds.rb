require "open-uri"
require 'faker'

Order.destroy_all
Affiliation.destroy_all
Registration.destroy_all
DivisionCriterium.destroy_all
Criterium.destroy_all
HeatUser.destroy_all
Heat.destroy_all
CompetitionDivision.destroy_all
UserFederationDivisionScore.destroy_all
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

file = URI.open('https://avatars0.githubusercontent.com/u/62013843?v=4')
pedro.photo.attach(io: file, filename: 'pedro.jpg', content_type: 'image/jpg')

camila = User.create!(first_name: 'Camila',
                    last_name: 'Silva',
                    date_of_birth: Date.new(1995,5,20),
                    nationality: 'BR',
                    gender: 'Female',
                    email: 'camilas@gmail.com',
                    password: '123456')

file = URI.open('https://avatars3.githubusercontent.com/u/25322909?v=4')
camila.photo.attach(io: file, filename: 'camila.jpg', content_type: 'image/jpg')

rez = User.create!(first_name: 'Rezwan',
                    last_name: 'Iqbal',
                    date_of_birth: Date.new(1995,6,10),
                    nationality: 'ROM',
                    gender: 'Male',
                    email: 'rezwani@gmail.com',
                    password: '123456')

file = URI.open('https://avatars0.githubusercontent.com/u/62059376?v=4')
rez.photo.attach(io: file, filename: 'rez.jpg', content_type: 'image/jpg')

nuno = User.create!(first_name: 'Nuno',
                    last_name: 'Lei',
                    date_of_birth: Date.new(1995,7,5),
                    nationality: 'PT',
                    gender: 'Male',
                    email: 'nunol@gmail.com',
                    password: '123456')

file = URI.open('https://avatars1.githubusercontent.com/u/63242007?v=4')
nuno.photo.attach(io: file, filename: 'nuno.jpg', content_type: 'image/jpg')

puts 'Creating divisions...'

age = Criterium.create!(name: 'age')
weight = Criterium.create!(name: 'weight')
belt = Criterium.create!(name: 'belt')

male_juvenile_light = Division.create!(name: 'male juvenile light weight 🚤')
DivisionCriterium.create!(division: male_juvenile_light, criterium: age, max: 16 )
DivisionCriterium.create!(division: male_juvenile_light, criterium: weight, max: 64 )

male_juvenile_middle = Division.create!(name: 'male juvenile middle weight 🛥')
DivisionCriterium.create!(division: male_juvenile_middle, criterium: age, max: 16 )
DivisionCriterium.create!(division: male_juvenile_middle, criterium: weight, max: 74 )

male_juvenile_heavy = Division.create!(name: 'male juvenile heavy weight 🚢')
DivisionCriterium.create!(division: male_juvenile_heavy, criterium: age, max: 16 )
DivisionCriterium.create!(division: male_juvenile_heavy, criterium: weight, max: 84)

male_juvenile_open_class = Division.create!(name: 'male juvenile open class 🚀')
DivisionCriterium.create!(division: male_juvenile_open_class, criterium: age, max: 16 )

male_adult_light = Division.create!(name: 'male adult light weight 🚤')
DivisionCriterium.create!(division: male_adult_light, criterium: age, max: 40 )
DivisionCriterium.create!(division: male_adult_light, criterium: weight, max: 76 )

male_adult_middle = Division.create!(name: 'male adult middle weight 🛥')
DivisionCriterium.create!(division: male_adult_middle, criterium: age, max: 40 )
DivisionCriterium.create!(division: male_adult_middle, criterium: weight, max: 82)

male_adult_heavy = Division.create!(name: 'male adult heavy weight 🚢')
DivisionCriterium.create!(division: male_adult_heavy, criterium: age, max: 40 )
DivisionCriterium.create!(division: male_adult_heavy, criterium: weight, max: 94)

male_adult_open_class = Division.create!(name: 'male adult open class 🚀')
DivisionCriterium.create!(division: male_adult_open_class, criterium: age, max: 40 )

female_juvenile_light = Division.create!(name: 'female juvenile light weight 🚤')
DivisionCriterium.create!(division: female_juvenile_light, criterium: age, max: 16 )
DivisionCriterium.create!(division: female_juvenile_light, criterium: weight, max: 56)

female_juvenile_middle = Division.create!(name: 'female juvenile middle weight 🛥')
DivisionCriterium.create!(division: female_juvenile_middle, criterium: age, max: 16 )
DivisionCriterium.create!(division: female_juvenile_middle, criterium: weight, max: 60)

female_juvenile_heavy = Division.create!(name: 'female juvenile heavy weight 🚢')
DivisionCriterium.create!(division: female_juvenile_heavy, criterium: age, max: 16 )
DivisionCriterium.create!(division: female_juvenile_heavy, criterium: weight, max: 64)

female_juvenile_open_class = Division.create!(name: 'female juvenile open class 🚀')
DivisionCriterium.create!(division: female_juvenile_open_class, criterium: age, max: 16 )

female_adult_light = Division.create!(name: 'female adult light weight 🚤')
DivisionCriterium.create!(division: female_adult_light, criterium: age, max: 40 )
DivisionCriterium.create!(division: female_adult_light, criterium: weight, max: 64 )

female_adult_middle = Division.create!(name: 'female adult middle weight 🛥')
DivisionCriterium.create!(division: female_adult_middle, criterium: age, max: 40 )
DivisionCriterium.create!(division: female_adult_middle, criterium: weight, max: 69)

female_adult_heavy = Division.create!(name: 'female adult heavy weight 🚢')
DivisionCriterium.create!(division: female_adult_heavy, criterium: age, max: 40 )
DivisionCriterium.create!(division: female_adult_heavy, criterium: weight, max: 74)

female_adult_open_class = Division.create!(name: 'female adult open class 🚀')
DivisionCriterium.create!(division: female_adult_open_class, criterium: age, max: 40 )

puts 'Creating federations...'

fjjrio = Federation.create!(name: 'FJJRIO',
                            location: 'Rio de Janeiro',
                            affiliation_price: '50',
                            email: 'fjjrio@gmail.com',
                            password: '123456')
 # - Federação de Jiu-Jitsu do Rio

file = URI.open('https://pbs.twimg.com/profile_images/655753850/LOGO_OFICIAL_FJJ-RIO_400x400.bmp')
fjjrio.photo.attach(io: file, filename: 'fjjrio.jpg', content_type: 'image/jpg')

 cbjj = Federation.create!(name: 'CBJJ',
                          location: 'Brazil',
                          affiliation_price: '70',
                          email: 'cbjj@gmail.com',
                          password: '123456')
 # - Confederação Brasileira de Jiu-Jitsu

file = URI.open('https://cbjj.com.br/wp-content/uploads/2014/02/cbjj_logo_news2.jpg')
cbjj.photo.attach(io: file, filename: 'cbjj.png', content_type: 'image/jpg')

 fpjjb = Federation.create!(name: 'FPJJ',
                          location: 'Lisbon',
                          affiliation_price: '30',
                          email: 'fpjjb@gmail.com',
                          password: '123456')
 # - Federação Portuguesa de Jiu-Jitsu

file = URI.open('https://jiujitsuportugal.files.wordpress.com/2016/09/fpjjb-2.jpg?w=241')
fpjjb.photo.attach(io: file, filename: 'fpjjb.jpg', content_type: 'image/jpg')


sjjsaf = Federation.create!(name: 'SJJSAF',
                          location: 'South America',
                          affiliation_price: '70',
                          email: 'sjjsaf@gmail.com',
                          password: '123456')
 # - Sport Jiu-Jitsu South American Federation

file = URI.open('https://i.pinimg.com/280x280_RS/9c/c3/62/9cc362e08c1d1282522ab9a474ba24eb.jpg')
sjjsaf.photo.attach(io: file, filename: 'sjjsaf.jpg', content_type: 'image/jpg')



puts 'Creating competitions...'

# FJJRIO

rio_open = Competition.create!(name: 'Rio Open',
                              address: 'Rua Conde de Bonfim, 451 - Tijuca, Rio de Janeiro, Brasil',
                              federation: fjjrio,
                              date: Date.new(2020,8,20),
                              description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse blandit arcu a erat egestas, sed cursus nunc congue. Quisque feugiat finibus dolor sit amet consequat. Morbi ut finibus neque. Nam tristique augue turpis, nec vehicula enim blandit eget. Sed vel tellus faucibus, condimentum leo non, hendrerit magna. Aliquam consequat sed.',
                              prize: 500,
                              registration_deadline: Date.new(2020,8,13),
                              registration_price: 50)

Division.all.each do |division|
  CompetitionDivision.create!(competition: rio_open, division: division)
end

carlson_gracie = Competition.create!(name: 'Carlson Gracie',
                                    address: 'Rua Conde de Bonfim, 451 - Tijuca, Rio de Janeiro, Brasil',
                                    federation: fjjrio,
                                    date: Date.new(2020,9,18),
                                    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse blandit arcu a erat egestas, sed cursus nunc congue. Quisque feugiat finibus dolor sit amet consequat. Morbi ut finibus neque. Nam tristique augue turpis, nec vehicula enim blandit eget. Sed vel tellus faucibus, condimentum leo non, hendrerit magna. Aliquam consequat sed.',
                                    prize: 300,
                                    registration_deadline: Date.new(2020,9,5),
                                    registration_price: 40)

Division.all.each do |division|
  CompetitionDivision.create!(competition: carlson_gracie, division: division)
end

summer_open = Competition.create!(name: 'Summer Open',
                                    address: 'Av. Embaixador Abelardo Bueno, 3401 - Barra da Tijuca, Rio de Janeiro, Brasil',
                                    federation: fjjrio,
                                    date: Date.new(2020,12,15),
                                    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse blandit arcu a erat egestas, sed cursus nunc congue. Quisque feugiat finibus dolor sit amet consequat. Morbi ut finibus neque. Nam tristique augue turpis, nec vehicula enim blandit eget. Sed vel tellus faucibus, condimentum leo non, hendrerit magna. Aliquam consequat sed.',
                                    prize: 450,
                                    registration_deadline: Date.new(2020,07,01),
                                    registration_price: 40)

# CBJJ

brasileiro = Competition.create!(name: 'Brasileiro',
                                    address: 'São Paulo, Brasil',
                                    federation: cbjj,
                                    date: Date.new(2020,10,12),
                                    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse blandit arcu a erat egestas, sed cursus nunc congue. Quisque feugiat finibus dolor sit amet consequat. Morbi ut finibus neque. Nam tristique augue turpis, nec vehicula enim blandit eget. Sed vel tellus faucibus, condimentum leo non, hendrerit magna. Aliquam consequat sed.',
                                    prize: 1000,
                                    registration_deadline: Date.new(2020,10,5),
                                    registration_price: 50)

Division.all.each do |division|
  CompetitionDivision.create!(competition: brasileiro, division: division)
end

brasileiro_kids = Competition.create!(name: 'Brasileiro Kids',
                                    address: 'Av. Embaixador Abelardo Bueno, 3401 - Barra da Tijuca, Rio de Janeiro, Brasil',
                                    federation: cbjj,
                                    date: Date.new(2020,10,20),
                                    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse blandit arcu a erat egestas, sed cursus nunc congue. Quisque feugiat finibus dolor sit amet consequat. Morbi ut finibus neque. Nam tristique augue turpis, nec vehicula enim blandit eget. Sed vel tellus faucibus, condimentum leo non, hendrerit magna. Aliquam consequat sed.',
                                    prize: 0,
                                    registration_deadline: Date.new(2020,10,13),
                                    registration_price: 40)

# FPJJB

lisbon_open = Competition.create!(name: 'Lisbon Open',
                                    address: 'R. João da Silva 20, 1900-098 Lisboa, Portugal',
                                    federation: fpjjb,
                                    date: Date.new(2020,6,28),
                                    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse blandit arcu a erat egestas, sed cursus nunc congue. Quisque feugiat finibus dolor sit amet consequat. Morbi ut finibus neque. Nam tristique augue turpis, nec vehicula enim blandit eget. Sed vel tellus faucibus, condimentum leo non, hendrerit magna. Aliquam consequat sed.',
                                    prize: 200,
                                    registration_deadline: Date.new(2020,6,15),
                                    registration_price: 40)

# SJJSAF

copa_america = Competition.create!(name: 'Copa America',
                                    address: 'Estr. São Pedro de Alcântara, 2020 - Vila Militar, Rio de Janeiro, Brasil',
                                    federation: sjjsaf,
                                    date: Date.new(2020,10,18),
                                    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse blandit arcu a erat egestas, sed cursus nunc congue. Quisque feugiat finibus dolor sit amet consequat. Morbi ut finibus neque. Nam tristique augue turpis, nec vehicula enim blandit eget. Sed vel tellus faucibus, condimentum leo non, hendrerit magna. Aliquam consequat sed.',
                                    prize: 300,
                                    registration_deadline: Date.new(2020,10,4),
                                    registration_price: 30)

rio_challenge = Competition.create!(name: 'Rio Challenge',
                                    address: 'Estr. São Pedro de Alcântara, 2020 - Vila Militar, Rio de Janeiro, Brasil',
                                    federation: sjjsaf,
                                    date: Date.new(2020,12,5),
                                    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse blandit arcu a erat egestas, sed cursus nunc congue. Quisque feugiat finibus dolor sit amet consequat. Morbi ut finibus neque. Nam tristique augue turpis, nec vehicula enim blandit eget. Sed vel tellus faucibus, condimentum leo non, hendrerit magna. Aliquam consequat sed.',
                                    prize: 200,
                                    registration_deadline: Date.new(2020,11,25),
                                    registration_price: 40)

puts 'Creating fake users...'

count = 0
competition_division = CompetitionDivision.find_by(competition: rio_open)

10.times do
  count += 1
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
  Registration.create!(competition_division: competition_division, user: fake_user)
  UserFederationDivisionScore.create!(user: fake_user, federation: fjjrio, division: competition_division.division)

  file = URI.open(Faker::Avatar.image)
  fake_user.photo.attach(io: file, filename: 'user_fake.jpg', content_type: 'image/jpg')
end

puts 'Creating heats...'

competition_division.create_heats

puts 'Done 🎉'
