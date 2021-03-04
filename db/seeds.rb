# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Start cleaning database"

puts "Deleting Queue Positions"
QueuePosition.destroy_all
puts 'Queue positions database is clean'

puts "Deleting Customers"
Customer.destroy_all
puts 'Customer database is clean'

puts "Deleting Stores"
Store.destroy_all
puts 'Stores database is clean'

puts "Deleting Users/Owners"
User.destroy_all
puts 'User/Owner database is clean'

# Creating user (shop owner)
user = User.create(
    email: "user@user.example",
    password: "123456"
)
puts "User was created."

# Creating users store
users_store = Store.create(
    store_name: Faker::Company.name,
    store_capacity: 5,
    qr_code: 'test', # need to be changed
    user_id: user.id
)
puts "Store \"#{users_store.store_name}\" was created."

position = 1

# Creating users and queue positions
10.times do
    customer = Customer.create(
        mobile_number: Faker::Base.numerify('0044 #### ### ###')
        )
    customers_queue = QueuePosition.create(
        customer_id: customer.id,
        store_id: users_store.id,
        position: position
        )
    puts "Customer #{customer.id} provided a phone number \"#{customer.mobile_number}\" and was added as #{customers_queue.position} to the queue."
    position += 1
end
puts "Database seeded!"
