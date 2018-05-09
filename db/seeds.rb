AdminUser.create(email: "admin@test.com",
                password: "asdfasdf",
                password_confirmation: "asdfasdf",
                first_name: "Admin",
                last_name: "Name",
                phone: "59177632551")

puts "1 Admin User created"

user = User.create(email: "test@test.com",
                  password: "asdfasdf",
                  password_confirmation: "asdfasdf",
                  first_name:"Juan",
                  last_name: "Perez",
                  phone: "59177632551")
puts '1 User created'

100.times do |post|
  Post.create(date: Time.zone.today, rationale: "#{post} rationale", user_id: user.id, overtime_request: 2.5)
end
puts '100 Post have been created'

100.times do |audit_log|
  AuditLog.create!(user_id: User.last.id, status: 0, start_date: (Date.today - 6.days))
end

puts "100 audit logs have been created"
