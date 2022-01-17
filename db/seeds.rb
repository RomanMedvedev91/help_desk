# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
# def open_asset(file_name)
#   File.open(Rails.root.join('db', 'seed_assets', file_name))
# end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

#------------------------------------------------------------------
## TICKET_PRIORITIES

puts "Creating Ticket Priorities ..."
TicketPriority.destroy_all

rec1 = TicketPriority.new
rec1.code = "Low"
rec1.description = "Priority Low"
rec1.business_days = 5
rec1.business_hours = 0
rec1.save

rec1 = TicketPriority.new
rec1.code = "Medium"
rec1.description = "Priority Medium"
rec1.business_days = 4
rec1.business_hours = 0
rec1.save

rec1 = TicketPriority.new
rec1.code = "High"
rec1.description = "Priority High"
rec1.business_days = 3
rec1.business_hours = 0
rec1.save

#-----------------------------------------------------------------
## TICKET Status

puts "Creating Ticket Status ..."
TicketStatusCode.destroy_all

rec1 = TicketStatusCode.new
rec1.code = "Opened"
rec1.description = "Status Opened"
rec1.save

rec1 = TicketStatusCode.new
rec1.code = "Assigned"
rec1.description = "Status Assigned"
rec1.save

rec1 = TicketStatusCode.new
rec1.code = "Waiting"
rec1.description = "Status Waiting"
rec1.save

rec1 = TicketStatusCode.new
rec1.code = "Closed"
rec1.description = "Status Closed"
rec1.save

#-----------------------------------------------------------------
## TICKET Type

puts "Creating Ticket Types ..."
TicketType.destroy_all

rec1 = TicketType.new
rec1.code = "Website"
rec1.description = "Status Originated From WebSite"
rec1.save

rec1 = TicketType.new
rec1.code = "Call"
rec1.description = "Ticket Originated From A Call"
rec1.save

#-----------------------------------------------------------------
## User Type

puts "Creating User Types ..."
UserType.destroy_all

rec1 = UserType.new
rec1.code = "User"
rec1.description = "User Is Customer"
rec1.save

rec2 = UserType.new
rec2.code = "Technician"
rec2.description = "Technician"
rec2.save

rec3 = UserType.new
rec3.code = "Admin"
rec3.description = "Administrator"
rec3.save


#-----------------------------------------------------------------
## User Type

puts "Creating Users ..."
User.destroy_all

user1 = User.new
user1.name = "Bob Dylan"
user1.mobile = "613.888.8888"
user1.email = "bdylan@email.com"
user1.user_type_id = rec3.id
user1.password_digest = "User Is Customer"
user1.save


#------------------------------------------------------------------
## QA Category

puts "Creating QA Categories ..."
Qa.destroy_all
QaCategory.destroy_all

qa_category1 = QaCategory.new
qa_category1.code = "Hardware"
qa_category1.description = "Hardware FAQ Category"
qa_category1.save

qa_category2 = QaCategory.new
qa_category2.code = "Software"
qa_category2.description = "Software FAQ Category"
qa_category2.save

qa_category3 = QaCategory.new
qa_category3.code = "Accessories"
qa_category3.description = "Accessories FAQ Category"
qa_category3.save
#-----------------------------------------------------------------
## QAs

puts "Creating QAs ..."
#Qa.destroy_all

rec1 = Qa.new
rec1.qa_category_id = qa_category1.id
rec1.problem  = "Problem One"
rec1.solution = "Solution One"
rec1.save

rec1 = Qa.new
rec1.qa_category_id = qa_category2.id
rec1.problem = "Problem 2"
rec1.solution = "Solution 2"
rec1.save

rec1 = Qa.new
rec1.qa_category_id = qa_category3.id
rec1.problem = "Problem 3"
rec1.solution = "Solution 3"
rec1.save

#-----------------------------------------------------------------
## SLA

puts "Creating Service Level Agreement ..."
ServiceLevelAgreement.destroy_all

sla1 = ServiceLevelAgreement.new
sla1.code = "New Customer"
sla1.description = "New Customer "
sla1.business_days = 3
sla1.business_hours = 0
sla1.save

sla2 = ServiceLevelAgreement.new
sla2.code = "Repeat Customer"
sla2.description = "Repeat Customer"
sla2.business_days = 2
sla2.business_hours = 0
sla2.save

sla3 = ServiceLevelAgreement.new
sla3.code = "VIP"
sla3.description = "VIP Customer"
sla3.business_days = 0
sla3.business_hours = 4
sla3.save

#-----------------------------------------------------------------
## Category

puts "Creating Product Categories ..."
Product.destroy_all
Category.destroy_all

cat1 = Category.new
cat1.code = "Laptop"
cat1.description = "Laptops"
cat1.save

cat2 = Category.new
cat2.code = "Chrombook"
cat2.description = "Chromebooks"
cat2.save

cat3 = Category.new
cat3.code = "Desktop"
cat3.description = "Desktops"
cat3.save

#-----------------------------------------------------------------
## PRODUCTS

puts "Creating Products ..."
#Product.destroy_all

# rec1 = Product.new
# re1.category_id = 1
# re1.code =  'Toshiba'
# re1.model = 'SX100'
# re1.description = "Description 1"
# re1.quantity = 10
# rec1.save

# rec1 = Product.new
# rec1.code = "VIP"
# rec1.description = "VIP Customer"
# rec1.business_days = 0
# rec1.business_hours = 4
# rec1.save

cat1.products.create!({
  code:  'Toshiba',
  model: 'SX100',
  description: "Description 1"
  #image: open_asset('apparel1.jpg'),
  #quantity: 10
  #price: 64.99
})

cat1.products.create!({
  code:  'HP',
  model: 'LL100',
  description: "Description 2"
  #image: open_asset('apparel1.jpg'),
  #quantity: 17
  #price: 64.99
})

cat1.products.create!({
  code:  'DELL',
  model: 'JZ100',
  description: "Description 3"
  #image: open_asset('apparel1.jpg'),
  #quantity: 30
  #price: 64.99
})

cat2.products.create!({
  code:  'Samsung',
  model: 'CB100',
  description: "Description 4"
  #image: open_asset('apparel1.jpg'),
  #quantity: 14
  #price: 64.99
})

cat2.products.create!({
  code:  'HP',
  model: 'ABC',
  description: "Description 5"
  #image: open_asset('apparel1.jpg'),
  #quantity: 8
  #price: 64.99
})


cat3.products.create!({
  code:  'HP',
  model: 'HP100',
  description: "Description 6"
  #image: open_asset('apparel1.jpg'),
  #quantity: 7
  #price: 64.99
})

cat3.products.create!({
  code:  'DELL',
  model: 'XPN01',
  description: "Description 7"
  #image: open_asset('apparel1.jpg'),
  #quantity: 3
  #price: 64.99
})

cat3.products.create!({
  code:  'DELL',
  model: 'RNG00',
  description: "Description 8"
  #image: open_asset('apparel1.jpg'),
  #quantity: 4
  #price: 64.99
})


#---------------------------------------------------------
## Contract

puts "Creating Contracts ..."
Contract.destroy_all

contract1 = Contract.new
contract1.user_id = 2
contract1.service_level_agreement_id = sla1.id
contract1.sla_valid_start_date = -30.days.from_now
contract1.sla_valid_end_date = 150.days.from_now
contract1.save

contract2 = ServiceLevelAgreement.new
contract2.user_id = 2
contract2.service_level_agreement_id = sla2.id
contract2.sla_valid_start_date = -20.days.from_now
contract2.sla_valid_end_date = 200.days.from_now
contract2.save

contract3 = ServiceLevelAgreement.new
contract3.user_id = 2
contract3.service_level_agreement_id = sla3.id
contract3.sla_valid_start_date = -25.days.from_now
contract3.sla_valid_end_date = 100.days.from_now
contract3.save

#-----------------------------------------------------------------

puts "DONE!"
