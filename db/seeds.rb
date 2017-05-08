# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create(name: "Nguyen Thuan", email: "nt.apple.it@gmail.com", status: "0")

EmailTemplate.create(title: "Sample Template", content: "<h2>HTML <mark>Marked</mark> Formatting</h2>")

Setting.create(key: "email_template", value: 1)