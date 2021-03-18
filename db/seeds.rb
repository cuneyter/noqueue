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

stores = [
    {
        store_name: "Ikea",
        logo_url: "https://1000logos.net/wp-content/uploads/2017/02/IKEA-Emblem-Criticism.jpg"
    },
    {
        store_name: "Tesco",
        logo_url: "https://png2.cleanpng.com/sh/b2ff330c58fd76a2758a50a487a05500/L0KzQYm3VcEzN6t2j5H0aYP2gLBuTgRme5R0Rdp4bXXzfMb6TgJmfJJuhJ98dYDogr7okvtmfF55feVsbz3sgrbzgf5lNWZmfqgEZHa8cYfqg8U1NmI1Uak6NkK8QYa5VsEyOWg4T6gDM0KxgLBu/kisspng-tesco-homeplus-retail-supermarket-tesco-ireland-5af69df9a6cc54.1097162915261117376832.png"
    },
    {
        store_name: "Pret A Manger",
        logo_url: "https://images.squarespace-cdn.com/content/v1/5401ae84e4b0132427c17f4a/1505897352989-3C3YVO6VEOK8PAWLPOWE/ke17ZwdGBToddI8pDm48kKFukq0Qr_Tmj7sMr3y8B5IUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKcAHMB_z5LuXL73jF3ktV0S-iFu9BlBZj9n2dQNiJr0TsifEOwHMs-lLtU1AsaPLSr/Trusted+by+Pret+a+Manger"
    },
    {
        store_name: "M&S",
        logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/MarksAndSpencer1884_logo.svg/1200px-MarksAndSpencer1884_logo.svg.png"
    },
    {
        store_name: "Costa",
        logo_url: "https://metquarter.com/wp-content/uploads/2018/10/COSTA_COFFEE_SCREEN_USE_BLK.png"
    },
    {
        store_name: "Apple",
        logo_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/647px-Apple_logo_black.svg.png"
    }
    ]
# Creating users store

stores.each do |store|
    Store.create(
        store_name: store[:store_name],
        logo_url: store[:logo_url],
        store_capacity: 5,
        qr_code: 'test', # need to be changed
        user_id: user.id
    )
    puts "Store \"#{store[:store_name]}\" was created."
end

position = 1

# Creating users and queue positions
10.times do
    customer = Customer.create(
        mobile_number: Faker::Base.numerify('0044 #### ### ###')
        )
    customers_queue = QueuePosition.create(
        customer_id: customer.id,
        store_id: 1,
        position: position
        )
    puts "Customer #{customer.id} provided a phone number \"#{customer.mobile_number}\" and was added as #{customers_queue.position} to the queue."
    position += 1
end
puts "Database seeded!"
