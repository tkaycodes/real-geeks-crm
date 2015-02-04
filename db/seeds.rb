# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#puts "Deleting old Agents..."
#Agent.destroy_all
puts "Creating Agents..."
Agent.create(email: "jeff@realgeeks.com", password: "testtest", name: "Jeff Manson", role: "Admin", phone: "808-880-8881")
Agent.create(email: "kevin@realgeeks.com", password: "testtest", name: "Kevin McCarthy", role: "Admin", phone: "808-880-8882")
Agent.create(email: "chris@realgeeks.com", password: "testtest", name: "Chris Sass", role: "Agent", phone: "808-880-8883")

puts "Deleting old Leads..."
Lead.destroy_all
50.times do
  Lead.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_address,
    start_date: (2..25).to_a.sample.days.ago,
    active_at: (2..25).to_a.sample.hours.ago,
    agent_id: Agent.ids.sample
  )
end
