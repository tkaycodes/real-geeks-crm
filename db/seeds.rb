# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creating Users..."
Agent.create(email: "jeff@realgeeks.com", password: "testtest", name: "Jeff Manson", role: "Admin", phone: "808-880-8881")
Agent.create(email: "kevin@realgeeks.com", password: "testtest", name: "Kevin McCarthy", role: "Admin", phone: "808-880-8882")
Agent.create(email: "chris@realgeeks.com", password: "testtest", name: "Chris Sass", role: "Agent", phone: "808-880-8883")
