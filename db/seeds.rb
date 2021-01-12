# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create companies
  # title: Faker::Company.name
  # invitation_code: Faker::Alphanumeric.alphanumeric(number: 10)

# Create users
  # first_name: Faker::Name.first_name
  # last_name: Faker::Name.last_name
  # open_id: Faker::IDNumber.brazilian_citizen_number
  # nickname: Faker::Kpop.girl_groups
  # phonenumber: Faker::PhoneNumber.cell_phone_in_e164
  # email: Faker::Internet.email
  # avatar: Faker::Avatar.image

# Create categories ['travel', 'food', 'IT', '']
# Create projects ['KWV', 'Zuju', 'Mixnanza'], Faker::Alphanumeric.alphanumeric(number: 10)
  # description: Faker::Books::Dune.quote
  # budget: [1200, 5000, 10000]
# Create accounts ['Alipay', 'WeChat', 'Merchants', 'HK']
# Reports
  # title: Faker::Books::Dune.character
  # description: Faker::Books::Dune.quote
  # start_date:
  # end_date

