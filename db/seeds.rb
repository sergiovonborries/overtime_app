100.times do |post|
  Post.create(date: Time.zone.today, rationale: "#{post} rationale")
end

puts '100 Post have been created'
