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

# Create categories ['Travel', 'Meal', 'IT', 'Office Supplies', 'Other, Parking', 'Telephone Expenses', 'Lodging']
# Create projects ['KWV', 'Zuju', 'Mixnanza'], Faker::Alphanumeric.alphanumeric(number: 10)
  # description: Faker::Books::Dune.quote
  # budget: [1200, 5000, 10000]
# Create accounts ['Alipay', 'WeChat', 'Merchants', 'HK']
# Reports
  # title: Faker::Books::Dune.character
  # description: Faker::Books::Dune.quote
  # start_date:
  # end_date

#expenses
  #description: Faker::Company.bs
  #expense_date: random dates
  #reimbursement: 10 true, 5 falses
  #report_id: attach
  #user_id: attach
  #project_id: attach
  #fapiao 10 true, 5 false
  #approved: 10 approved, 5 pending
  #amount: random

categories = ['Travel', 'Meal', 'IT', 'Office Supplies', 'Other, Parking', 'Telephone Expenses', 'Lodging']
projects = ['KWV', 'Cognac Association', 'Mixnanza', 'Christmas Party']
budgets = [1200.50, 5000.50, 10000]
my_amounts = [20, 30, 40, 100, 150, 22.50, 32.30, 510, 3587]
accounts = ['Alipay', 'WeChat', 'Merchants', 'HK']
today = Time.now.strftime('%F')
next_week = Time.new(2021,01,30).strftime('%F')
next_month = Time.new(2021,02,23).strftime('%F')
march = Time.new(2021,03,23).strftime('%F')
dates = [today, next_week, next_month, march]


    # t.string "description"
    # t.bigint "category_id", null: false
    # t.datetime "expense_date"
    # t.boolean "reimbursement"
    # t.bigint "account_id"
    # t.bigint "report_id"
    # t.bigint "user_id", null: false
    # t.bigint "project_id"
    # t.boolean "fapiao"
    # t.boolean "approved"
    # t.float "amount"

p 'Destroying & Creating Categories'
categories.each do |category|
  cat = Category.new(description: category)
  cat.save
  p "#{cat.description} got created"
end

## Instances to be accessed later
all_categories = Category.all

p 'Destroying & Creating accounts'
accounts.each do |account|
  acc = Account.new(description: account)
  acc.save
  p "#{acc.description} got created"
end

all_accounts = Account.all

p 'Destroying & Creating projects'
projects.each do |project|
  proj = Project.new(title: project, description: Faker::Books::Dune.quote, invitation_code: Faker::Alphanumeric.alphanumeric(number: 10), budget: budgets.sample )
  proj.save
p "#{proj.title} got created"
end

all_projects = Project.all

5.times do
  company = Company.new(name: Faker::Company.name, invitation_code: Faker::Alphanumeric.alphanumeric(number: 10) )
  company.save
  p "#{company.name} got created"
  3.times do
    user = User.new(email: Faker::Internet.email, open_id: Faker::Alphanumeric.alphanumeric(number: 10), nickname: Faker::Kpop.girl_groups, phonenumber: Faker::PhoneNumber.cell_phone_in_e164, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, avatar: 'https://picsum.photos/600')
    user.password = Faker::Alphanumeric.alphanumeric(number: 10)
    user.company = company
    user.save
    p "#{user.nickname} got created"
    report = Report.new(title: Faker::Books::Dune.character,
      description: Faker::Books::Dune.quote,
      start_date: today,
      end_date: next_week,
      user_id: user.id)
    report.save
    p "#{report.title} got created!!"

    p 'Starting the expenses --------------------'
    3.times do
      exp = Expense.create!(description: Faker::Company.bs, category_id: all_categories.sample.id, expense_date: dates.sample, reimbursement: true, report_id: report.id, user_id: user.id, fapiao: true, approved: false, amount: my_amounts.sample   )
      exp.save
      p "#{exp.description} got created"
    end
    2.times do
      exp = Expense.create!(description: Faker::Company.bs, category_id: all_categories.sample.id, expense_date: dates.sample, reimbursement: false, report_id: report.id, account_id: all_accounts.sample.id, user_id: user.id, fapiao: true, approved: false, amount: my_amounts.sample   )
      p "#{exp.description} got created"
    end

    2.times do
      exp = Expense.create!(description: Faker::Company.bs, category_id: all_categories.sample.id, expense_date: dates.sample, reimbursement: false, account_id: all_accounts.sample.id, user_id: user.id, project_id: all_projects.sample.id, fapiao: true, approved: false, amount: my_amounts.sample)
      p exp
      p "#{exp.description} got created"
    end
  end
end



    # t.string "description"
    # t.bigint "category_id", null: false
    # t.datetime "expense_date"
    # t.boolean "reimbursement"
    # t.bigint "account_id"
    # t.bigint "report_id"
    # t.bigint "user_id", null: false
    # t.bigint "project_id"
    # t.boolean "fapiao"
    # t.boolean "approved"
    # t.float "amount"

