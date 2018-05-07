user = User.create(email: "test@test.com", password: "asdfasdf",
  password_confirmation: "asdfasdf", first_name:"Juan", last_name: "Perez")
puts '1 User created'

AdminUser.create(email: "admin@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Admin", last_name: "Name")

puts "1 Admin User created"

100.times do |post|
  Post.create(date: Time.zone.today, rationale: "#{post} rationale", user_id: user.id, overtime_request: 2.5)
end

puts '100 Post have been created'
