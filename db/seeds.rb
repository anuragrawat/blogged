# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


3.times do |i|
  User.create(:name => "anu#{i}", :email => "anu#{i}@gmail.com", :password => "abcdabcd", :password_confirmation => 'abcdabcd')
end

10.times do |i|
  a = Article.new(title: "art #{i}", body: "abcd #{i + i }")
  a.user_id = User.first.id
  a.save
end