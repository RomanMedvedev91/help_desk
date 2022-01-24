require 'date'
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
puts "Start Deleting All Records From Database"

#Note.destroy.all
Ticket.destroy_all

ContractProduct.destroy_all
Contract.destroy_all
ServiceLevelAgreement.destroy_all

User.destroy_all
UserType.destroy_all

Product.destroy_all
Category.destroy_all

Qa.destroy_all
QaCategory.destroy_all

TicketPriority.destroy_all
TicketStatusCode.destroy_all
TicketType.destroy_all

StatTechnician.destroy_all
StatTicket.destroy_all

puts "End Deleting All Records From Database"

#------------------------------------------------------------------
## TICKET_PRIORITIES

puts "Creating Ticket Priorities ..."

priority1 = TicketPriority.new
priority1.code = "Low"
priority1.description = "Priority Low"
priority1.business_days = 5
priority1.business_hours = 0
priority1.save

priority2 = TicketPriority.new
priority2.code = "Medium"
priority2.description = "Priority Medium"
priority2.business_days = 4
priority2.business_hours = 0
priority2.save

priority3 = TicketPriority.new
priority3.code = "High"
priority3.description = "Priority High"
priority3.business_days = 3
priority3.business_hours = 0
priority3.save

#-----------------------------------------------------------------
## TICKET Status

puts "Creating Ticket Status ..."

status1 = TicketStatusCode.new
status1.code = "Opened"
status1.description = "Status Opened"
status1.save

status2 = TicketStatusCode.new
status2.code = "Assigned"
status2.description = "Status Assigned"
status2.save

status3 = TicketStatusCode.new
status3.code = "Waiting"
status3.description = "Status Waiting"
status3.save

status4 = TicketStatusCode.new
status4.code = "Closed"
status4.description = "Status Closed"
status4.save

#-----------------------------------------------------------------
## TICKET Type

puts "Creating Ticket Types ..."

type1 = TicketType.new
type1.code = "Website"
type1.description = "Status Originated From WebSite"
type1.save

type2 = TicketType.new
type2.code = "Call"
type2.description = "Ticket Originated From A Call"
type2.save

#-----------------------------------------------------------------
## User Type

puts "Creating User Types ..."

user_type1 = UserType.new
user_type1.code = "User"
user_type1.description = "User Is Customer"
user_type1.save

user_type2 = UserType.new
user_type2.code = "Technician"
user_type2.description = "Technician"
user_type2.save

user_type3 = UserType.new
user_type3.code = "Admin"
user_type3.description = "Administrator"
user_type3.save


#-----------------------------------------------------------------
## Users

puts "Creating Users ..."

user1 = User.new
user1.name = "Bob Dylan"
user1.mobile = "6138888888"
user1.email = "bdylan@email.com"
user1.user_type_id = user_type3.id
user1.password = "123456"
user1.password_confirmation = "123456"
# user1.password_digest = "$2a$12$Fzzaxc57hUCpmPkYyK54KeShZujLX3LJfACeJIhm4/H0zY1/USb.i"
user1.save

user2 = User.new
user2.name = "Eric Clapton"
user2.mobile = "6137777777"
user2.email = "eclapton@email.com"
user2.user_type_id = user_type2.id
user2.password = "123456"
user2.password_confirmation = "123456"
user2.save

user3 = User.new
user3.name = "Jimi Hendrix"
user3.mobile = "6135555555"
user3.email = "jhendrix@email.com"
user3.user_type_id = user_type2.id
user3.password = "123456"
user3.password_confirmation = "123456"
user3.save

user4 = User.new
user4.name = "Jimi Page"
user4.mobile = "6134444444"
user4.email = "jpage@email.com"
user4.user_type_id = user_type2.id
user4.password = "123456"
user4.password_confirmation = "123456"
user4.save

user5 = User.new
user5.name = "Alvin Lee"
user5.mobile = "6132222222"
user5.email = "alee@email.com"
user5.user_type_id = user_type2.id
user5.password = "123456"
user5.password_confirmation = "123456"
user5.save

user6 = User.new
user6.name = "Richie Blackmore"
user6.mobile = "6130000001"
user6.email = "rblackmore@email.com"
user6.user_type_id = user_type2.id
user6.password = "123456"
user6.password_confirmation = "123456"
user6.save

#------------------------------------------------------------------
## QA Category

puts "Creating QA Categories ..."

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

product1 = Product.new
product1.category_id = cat1.id
product1.code =  'Toshiba'
product1.model = 'SX100'
product1.description = "Description 1"
product1.save

product2 = Product.new
product2.category_id = cat1.id
product2.code =  'HP'
product2.model = 'MN09DL2'
product2.description = "Description 2"
product2.save

product3 = Product.new
product3.category_id = cat1.id
product3.code =  'Dell'
product3.model = 'AHR-0900'
product3.description = "Description 3"
product3.save

product4 = Product.new
product4.category_id = cat2.id
product4.code =  'Toshiba'
product4.model = 'SX300'
product4.description = "Description 4"
product4.save

product5 = Product.new
product5.category_id = cat2.id
product5.code =  'HP'
product5.model = 'LDKJP9JD'
product5.description = "Description 5"
product5.save

product6 = Product.new
product6.category_id = cat2.id
product6.code =  'Dell'
product6.model = 'LKHIDKD'
product6.description = "Description 6"
product6.save

product7 = Product.new
product7.category_id = cat3.id
product7.code =  'Toshiba'
product7.model = 'R2DKKDLL'
product7.description = "Description 7"
product7.save

product8 = Product.new
product8.category_id = cat3.id
product8.code =  'HP'
product8.model = 'BR2KDJDKK'
product8.description = "Description 8"
product8.save

product9 = Product.new
product9.category_id = cat3.id
product9.code =  'Dell'
product9.model = 'AAAA1'
product9.description = "Description 9"
product9.save

#---------------------------------------------------------
## Contract

puts "Creating Contracts ..."

contract1 = Contract.new
contract1.user_id = user4.id
contract1.service_level_agreement_id = sla1.id
contract1.sla_valid_start_date = -30.days.from_now
contract1.sla_valid_end_date = 150.days.from_now
contract1.reference = 'Ref 100'
contract1.save

contract2 = Contract.new
contract2.user_id = user4.id
contract2.service_level_agreement_id = sla2.id
contract2.sla_valid_start_date = -20.days.from_now
contract2.sla_valid_end_date = 200.days.from_now
contract2.reference = 'Ref 101'
contract2.save

contract3 = Contract.new
contract3.user_id = user5.id
contract3.service_level_agreement_id = sla3.id
contract3.sla_valid_start_date = -25.days.from_now
contract3.sla_valid_end_date = 100.days.from_now
contract3.reference = 'Ref 102'
contract3.save

#-----------------------------------------------------------------
## Contract_Products

puts "Creating Contract Products ..."

contract_product1 = ContractProduct.new
contract_product1.contract_id = contract1.id
contract_product1.product_id = product1.id
contract_product1.serial_number = 'JKR00039872jdkd'
contract_product1.save

contract_product2 = ContractProduct.new
contract_product2.contract_id = contract2.id
contract_product2.product_id = product2.id
contract_product2.serial_number = 'JKR00039872jdkd'
contract_product2.save

contract_product3 = ContractProduct.new
contract_product3.contract_id = contract3.id
contract_product3.product_id = product3.id
contract_product3.serial_number = 'JKR00039872jdkd'
contract_product3.save

#-----------------------------------------------------------------

## Tickets

puts "Creating Tickets ..."

ticket1 = Ticket.new
ticket1.user_id = user4.id
ticket1.reference = "AB100"
ticket1.technician_id = user2.id
ticket1.contract_product_id = contract_product1.id
ticket1.ticket_type_id = type1.id
ticket1.ticket_status_code_id = status1.id
ticket1.ticket_priority_id = priority1.id
ticket1.problem_description = "It is not working"
ticket1.solution_description = ""
ticket1.assigned_at = -1.days.from_now
ticket1.closed_at = ''
ticket1.to_be_solved_at = 1.days.from_now
ticket1.category_id = cat1.id
ticket1.product_id = product1.id
ticket1.model = 'SX100'
ticket1.serial_number = 'HGDJEK'
ticket1.save

ticket2 = Ticket.new
ticket2.user_id = user5.id
ticket2.reference = "AB101"
ticket2.technician_id = user3.id
ticket2.contract_product_id = contract_product2.id
ticket2.ticket_type_id = type2.id
ticket2.ticket_status_code_id = status2.id
ticket2.ticket_priority_id = priority2.id
ticket2.problem_description = "It is not working at all"
ticket2.solution_description = ""
ticket2.assigned_at = -1.days.from_now
ticket2.closed_at = ''
ticket2.to_be_solved_at = 1.days.from_now
ticket1.category_id = cat1.id
ticket2.product_id = product3.id
ticket2.model = 'AHR-0900'
ticket2.serial_number = 'BPKDJ00D'
ticket2.save

ticket3 = Ticket.new
ticket3.user_id = user5.id
ticket3.reference = "AB105"
ticket3.technician_id = user4.id
ticket3.contract_product_id = contract_product2.id
ticket3.ticket_type_id = type1.id
ticket3.ticket_status_code_id = status3.id
ticket3.ticket_priority_id = priority2.id
ticket3.problem_description = "It is not working at all.No matter what I do"
ticket3.solution_description = ""
ticket3.assigned_at = -3.days.from_now
ticket3.closed_at = ''
ticket3.to_be_solved_at = 2.days.from_now
ticket3.category_id = cat3.id
ticket3.product_id = product9.id
ticket3.model = 'AAA1'
ticket3.serial_number = 'FKKKDJD088AL'
ticket3.save

ticket4 = Ticket.new
ticket4.user_id = user1.id
ticket4.reference = "AX205"
ticket4.technician_id = user4.id
ticket4.contract_product_id = contract_product2.id
ticket4.ticket_type_id = type1.id
ticket4.ticket_status_code_id = status1.id
ticket4.ticket_priority_id = priority1.id
ticket4.problem_description = "Big Problem"
ticket4.solution_description = ""
ticket4.assigned_at = -1.days.from_now
ticket4.closed_at = ''
ticket4.to_be_solved_at = 2.days.from_now
ticket4.category_id = cat1.id
ticket4.product_id = product1.id
ticket4.model = 'AAA3'
ticket4.serial_number = 'X0000Z29L'
ticket4.save

#-----------------------------------------------------------------
## stat_technicians

puts "Technician Statistics ..."

stat_technician = StatTechnician.new
stat_technician.name = user1.name
stat_technician.this_date = Date.today
stat_technician.assigned = 5
stat_technician.solved = 7
stat_technician.transferred = 1
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user1.name
stat_technician.this_date = Date.today - 1
stat_technician.assigned = 4
stat_technician.solved = 9
stat_technician.transferred = 1
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user1.name
stat_technician.this_date = Date.today - 2
stat_technician.assigned = 7
stat_technician.solved = 5
stat_technician.transferred = 0
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user1.name
stat_technician.this_date = Date.today - 3
stat_technician.assigned = 6
stat_technician.solved = 9
stat_technician.transferred = 3
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user1.name
stat_technician.this_date = Date.today - 4
stat_technician.assigned = 10
stat_technician.solved = 3
stat_technician.transferred = 0
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user1.name
stat_technician.this_date = Date.today - 5
stat_technician.assigned = 2
stat_technician.solved = 2
stat_technician.transferred = 7
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user1.name
stat_technician.this_date = Date.today - 6
stat_technician.assigned = 8
stat_technician.solved = 1
stat_technician.transferred = 1
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user1.name
stat_technician.this_date = Date.today - 7
stat_technician.assigned = 3
stat_technician.solved = 12
stat_technician.transferred = 0
stat_technician.save

#----------------

stat_technician = StatTechnician.new
stat_technician.name = user2.name
stat_technician.this_date = Date.today
stat_technician.assigned = 4
stat_technician.solved = 9
stat_technician.transferred = 0
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user2.name
stat_technician.this_date = Date.today - 1
stat_technician.assigned = 5
stat_technician.solved = 1
stat_technician.transferred = 4
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user2.name
stat_technician.this_date = Date.today - 2
stat_technician.assigned = 3
stat_technician.solved = 2
stat_technician.transferred = 0
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user2.name
stat_technician.this_date = Date.today - 3
stat_technician.assigned = 3
stat_technician.solved = 8
stat_technician.transferred = 0
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user2.name
stat_technician.this_date = Date.today - 4
stat_technician.assigned = 12
stat_technician.solved = 5
stat_technician.transferred = 1
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user2.name
stat_technician.this_date = Date.today - 5
stat_technician.assigned = 4
stat_technician.solved = 7
stat_technician.transferred = 3
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user2.name
stat_technician.this_date = Date.today - 6
stat_technician.assigned = 13
stat_technician.solved = 5
stat_technician.transferred = 3
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user2.name
stat_technician.this_date = Date.today - 7
stat_technician.assigned = 8
stat_technician.solved = 8
stat_technician.transferred = 0
stat_technician.save

#----------------

stat_technician = StatTechnician.new
stat_technician.name = user3.name
stat_technician.this_date = Date.today
stat_technician.assigned = 3
stat_technician.solved = 7
stat_technician.transferred = 1
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user3.name
stat_technician.this_date = Date.today - 1
stat_technician.assigned = 2
stat_technician.solved = 1
stat_technician.transferred = 7
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user3.name
stat_technician.this_date = Date.today - 2
stat_technician.assigned = 5
stat_technician.solved = 5
stat_technician.transferred = 0
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user3.name
stat_technician.this_date = Date.today - 3
stat_technician.assigned = 11
stat_technician.solved = 4
stat_technician.transferred = 0
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user3.name
stat_technician.this_date = Date.today - 4
stat_technician.assigned = 9
stat_technician.solved = 3
stat_technician.transferred = 1
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user3.name
stat_technician.this_date = Date.today - 5
stat_technician.assigned = 6
stat_technician.solved = 7
stat_technician.transferred = 3
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user3.name
stat_technician.this_date = Date.today - 6
stat_technician.assigned = 11
stat_technician.solved = 4
stat_technician.transferred = 2
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user3.name
stat_technician.this_date = Date.today - 7
stat_technician.assigned = 5
stat_technician.solved = 8
stat_technician.transferred = 3
stat_technician.save

#----------------

stat_technician = StatTechnician.new
stat_technician.name = user3.name
stat_technician.this_date = Date.today
stat_technician.assigned = 11
stat_technician.solved = 8
stat_technician.transferred = 0
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user3.name
stat_technician.this_date = Date.today - 1
stat_technician.assigned = 12
stat_technician.solved = 9
stat_technician.transferred = 4
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user3.name
stat_technician.this_date = Date.today - 2
stat_technician.assigned = 7
stat_technician.solved = 7
stat_technician.transferred = 0
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user3.name
stat_technician.this_date = Date.today - 3
stat_technician.assigned = 7
stat_technician.solved = 10
stat_technician.transferred = 0
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user3.name
stat_technician.this_date = Date.today - 4
stat_technician.assigned = 4
stat_technician.solved = 10
stat_technician.transferred = 1
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user3.name
stat_technician.this_date = Date.today - 5
stat_technician.assigned = 11
stat_technician.solved = 17
stat_technician.transferred = 3
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user3.name
stat_technician.this_date = Date.today - 6
stat_technician.assigned = 13
stat_technician.solved = 8
stat_technician.transferred = 3
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user3.name
stat_technician.this_date = Date.today - 7
stat_technician.assigned = 8
stat_technician.solved = 11
stat_technician.transferred = 0
stat_technician.save

#----------------

stat_technician = StatTechnician.new
stat_technician.name = user4.name
stat_technician.this_date = Date.today
stat_technician.assigned = 6
stat_technician.solved = 7
stat_technician.transferred = 3
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user4.name
stat_technician.this_date = Date.today - 1
stat_technician.assigned = 9
stat_technician.solved = 11
stat_technician.transferred = 0
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user4.name
stat_technician.this_date = Date.today - 2
stat_technician.assigned = 7
stat_technician.solved = 6
stat_technician.transferred = 1
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user4.name
stat_technician.this_date = Date.today - 3
stat_technician.assigned = 5
stat_technician.solved = 9
stat_technician.transferred = 1
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user4.name
stat_technician.this_date = Date.today - 4
stat_technician.assigned = 13
stat_technician.solved = 7
stat_technician.transferred = 1
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user4.name
stat_technician.this_date = Date.today - 5
stat_technician.assigned = 11
stat_technician.solved = 8
stat_technician.transferred = 1
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user4.name
stat_technician.this_date = Date.today - 6
stat_technician.assigned = 13
stat_technician.solved = 4
stat_technician.transferred = 1
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user4.name
stat_technician.this_date = Date.today - 7
stat_technician.assigned = 6
stat_technician.solved = 11
stat_technician.transferred = 2
stat_technician.save


#----------------

stat_technician = StatTechnician.new
stat_technician.name = user5.name
stat_technician.this_date = Date.today
stat_technician.assigned = 9
stat_technician.solved = 9
stat_technician.transferred = 1
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user5.name
stat_technician.this_date = Date.today - 1
stat_technician.assigned = 7
stat_technician.solved = 9
stat_technician.transferred = 3
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user5.name
stat_technician.this_date = Date.today - 2
stat_technician.assigned = 7
stat_technician.solved = 3
stat_technician.transferred = 0
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user5.name
stat_technician.this_date = Date.today - 3
stat_technician.assigned = 8
stat_technician.solved = 8
stat_technician.transferred = 1
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user5.name
stat_technician.this_date = Date.today - 4
stat_technician.assigned = 10
stat_technician.solved = 6
stat_technician.transferred = 1
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user5.name
stat_technician.this_date = Date.today - 5
stat_technician.assigned = 5
stat_technician.solved = 9
stat_technician.transferred = 2
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user5.name
stat_technician.this_date = Date.today - 6
stat_technician.assigned = 13
stat_technician.solved = 2
stat_technician.transferred = 0
stat_technician.save

stat_technician = StatTechnician.new
stat_technician.name = user5.name
stat_technician.this_date = Date.today - 7
stat_technician.assigned = 7
stat_technician.solved = 6
stat_technician.transferred = 1
stat_technician.save

#------------

## stat_tickets

puts "Tickets Statistics ..."

stat_ticket = StatTicket.new
stat_ticket.code = priority1.code
stat_ticket.this_date = Date.today
stat_ticket.no_of_tickets = 18
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority1.code
stat_ticket.this_date = Date.today -1
stat_ticket.no_of_tickets = 21
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority1.code
stat_ticket.this_date = Date.today -2
stat_ticket.no_of_tickets = 15
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority1.code
stat_ticket.this_date = Date.today -3
stat_ticket.no_of_tickets = 29
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority1.code
stat_ticket.this_date = Date.today -4
stat_ticket.no_of_tickets = 11
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority1.code
stat_ticket.this_date = Date.today -5
stat_ticket.no_of_tickets = 14
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority1.code
stat_ticket.this_date = Date.today -6
stat_ticket.no_of_tickets = 18
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority1.code
stat_ticket.this_date = Date.today -7
stat_ticket.no_of_tickets = 22
stat_ticket.record_type = 1
stat_ticket.save

#------

stat_ticket = StatTicket.new
stat_ticket.code = priority2.code
stat_ticket.this_date = Date.today
stat_ticket.no_of_tickets = 11
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority2.code
stat_ticket.this_date = Date.today -1
stat_ticket.no_of_tickets = 12
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority2.code
stat_ticket.this_date = Date.today -2
stat_ticket.no_of_tickets = 15
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority2.code
stat_ticket.this_date = Date.today -3
stat_ticket.no_of_tickets = 14
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority2.code
stat_ticket.this_date = Date.today -4
stat_ticket.no_of_tickets = 12
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority2.code
stat_ticket.this_date = Date.today -5
stat_ticket.no_of_tickets = 17
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority2.code
stat_ticket.this_date = Date.today -6
stat_ticket.no_of_tickets = 9
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority2.code
stat_ticket.this_date = Date.today -7
stat_ticket.no_of_tickets = 3
stat_ticket.record_type = 1
stat_ticket.save

#------

stat_ticket = StatTicket.new
stat_ticket.code = priority3.code
stat_ticket.this_date = Date.today
stat_ticket.no_of_tickets = 11
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority3.code
stat_ticket.this_date = Date.today -1
stat_ticket.no_of_tickets = 11
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority3.code
stat_ticket.this_date = Date.today -2
stat_ticket.no_of_tickets = 15
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority3.code
stat_ticket.this_date = Date.today -3
stat_ticket.no_of_tickets = 17
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority3.code
stat_ticket.this_date = Date.today -4
stat_ticket.no_of_tickets = 10
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority3.code
stat_ticket.this_date = Date.today -5
stat_ticket.no_of_tickets = 14
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority3.code
stat_ticket.this_date = Date.today -6
stat_ticket.no_of_tickets = 13
stat_ticket.record_type = 1
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = priority3.code
stat_ticket.this_date = Date.today -7
stat_ticket.no_of_tickets = 10
stat_ticket.record_type = 1
stat_ticket.save

#------

stat_ticket = StatTicket.new
stat_ticket.code = type1.code
stat_ticket.this_date = Date.today
stat_ticket.no_of_tickets = 20
stat_ticket.record_type = 3
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = type1.code
stat_ticket.this_date = Date.today -1
stat_ticket.no_of_tickets = 25
stat_ticket.record_type = 3
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = type1.code
stat_ticket.this_date = Date.today -2
stat_ticket.no_of_tickets = 22
stat_ticket.record_type = 3
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = type1.code
stat_ticket.this_date = Date.today -3
stat_ticket.no_of_tickets = 30
stat_ticket.record_type = 3
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = type1.code
stat_ticket.this_date = Date.today -4
stat_ticket.no_of_tickets = 19
stat_ticket.record_type = 3
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = type1.code
stat_ticket.this_date = Date.today -5
stat_ticket.no_of_tickets = 26
stat_ticket.record_type = 3
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = type1.code
stat_ticket.this_date = Date.today -6
stat_ticket.no_of_tickets = 19
stat_ticket.record_type = 3
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = type1.code
stat_ticket.this_date = Date.today -7
stat_ticket.no_of_tickets = 24
stat_ticket.record_type = 3
stat_ticket.save

#------

stat_ticket = StatTicket.new
stat_ticket.code = type2.code
stat_ticket.this_date = Date.today
stat_ticket.no_of_tickets = 25
stat_ticket.record_type = 3
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = type2.code
stat_ticket.this_date = Date.today -1
stat_ticket.no_of_tickets = 22
stat_ticket.record_type = 3
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = type2.code
stat_ticket.this_date = Date.today -2
stat_ticket.no_of_tickets = 22
stat_ticket.record_type = 3
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = type2.code
stat_ticket.this_date = Date.today -3
stat_ticket.no_of_tickets = 30
stat_ticket.record_type = 3
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = type2.code
stat_ticket.this_date = Date.today -4
stat_ticket.no_of_tickets = 27
stat_ticket.record_type = 3
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = type2.code
stat_ticket.this_date = Date.today -5
stat_ticket.no_of_tickets = 22
stat_ticket.record_type = 3
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = type2.code
stat_ticket.this_date = Date.today -6
stat_ticket.no_of_tickets = 25
stat_ticket.record_type = 3
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = type2.code
stat_ticket.this_date = Date.today -7
stat_ticket.no_of_tickets = 24
stat_ticket.record_type = 3
stat_ticket.save

#------

stat_ticket = StatTicket.new
stat_ticket.code = status1.code
stat_ticket.this_date = Date.today
stat_ticket.no_of_tickets = 21
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status1.code
stat_ticket.this_date = Date.today -1
stat_ticket.no_of_tickets = 27
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status1.code
stat_ticket.this_date = Date.today -2
stat_ticket.no_of_tickets = 23
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status1.code
stat_ticket.this_date = Date.today -3
stat_ticket.no_of_tickets = 18
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status1.code
stat_ticket.this_date = Date.today -4
stat_ticket.no_of_tickets = 22
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status1.code
stat_ticket.this_date = Date.today -5
stat_ticket.no_of_tickets = 24
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status1.code
stat_ticket.this_date = Date.today -6
stat_ticket.no_of_tickets = 19
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status1.code
stat_ticket.this_date = Date.today -7
stat_ticket.no_of_tickets = 15
stat_ticket.record_type = 2
stat_ticket.save

#------

stat_ticket = StatTicket.new
stat_ticket.code = status2.code
stat_ticket.this_date = Date.today
stat_ticket.no_of_tickets = 14
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status2.code
stat_ticket.this_date = Date.today -1
stat_ticket.no_of_tickets = 17
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status2.code
stat_ticket.this_date = Date.today -2
stat_ticket.no_of_tickets = 13
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status2.code
stat_ticket.this_date = Date.today -3
stat_ticket.no_of_tickets = 28
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status2.code
stat_ticket.this_date = Date.today -4
stat_ticket.no_of_tickets = 12
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status2.code
stat_ticket.this_date = Date.today -5
stat_ticket.no_of_tickets = 14
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status2.code
stat_ticket.this_date = Date.today -6
stat_ticket.no_of_tickets = 29
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status2.code
stat_ticket.this_date = Date.today -7
stat_ticket.no_of_tickets = 25
stat_ticket.record_type = 2
stat_ticket.save

#------


stat_ticket = StatTicket.new
stat_ticket.code = status3.code
stat_ticket.this_date = Date.today
stat_ticket.no_of_tickets = 25
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status3.code
stat_ticket.this_date = Date.today -1
stat_ticket.no_of_tickets = 30
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status3.code
stat_ticket.this_date = Date.today -2
stat_ticket.no_of_tickets = 20
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status3.code
stat_ticket.this_date = Date.today -3
stat_ticket.no_of_tickets = 20
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status3.code
stat_ticket.this_date = Date.today -4
stat_ticket.no_of_tickets = 20
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status3.code
stat_ticket.this_date = Date.today -5
stat_ticket.no_of_tickets = 25
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status3.code
stat_ticket.this_date = Date.today -6
stat_ticket.no_of_tickets = 22
stat_ticket.record_type = 2
stat_ticket.save

stat_ticket = StatTicket.new
stat_ticket.code = status3.code
stat_ticket.this_date = Date.today -7
stat_ticket.no_of_tickets = 17
stat_ticket.record_type = 2
stat_ticket.save

#------


puts "DONE!"