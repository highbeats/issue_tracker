# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['Sales', 'Support'].each do |name|
  Department.create!(name: name)
end

manager = Manager.create!(email: "example@example.com", password: "testsword", password_confirmation: "testsword")
