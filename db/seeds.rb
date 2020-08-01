# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user.leader?
user.leader


puts "creating users"
params = {}
params[:name] = "Linlu"
params[:leader] = true
linlu = User.new(params)
linlu.save
puts "Created user #{linlu.id}"

params = {}
params[:name] = "Hayato Clarke"
params[:leader] = true
hayato = User.new(params)
hayato.save
puts "Created user #{hayato.id}"

leaders = [hayato, linlu]

params = {}
params[:name] = "Davide Zannet"
params[:leader] = false
params[:leader_id] = leaders.sample.id

new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Cassiano Yasumitsu"
params[:leader] = false
params[:leader_id] = leaders.sample.id

new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Liam Baker"
params[:leader] = false
params[:leader_id] = leaders.sample.id

new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Yurie Shiotani"
params[:leader] = false
params[:leader_id] = leaders.sample.id

new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Wanying Kwok"
params[:leader] = false
params[:leader_id] = leaders.sample.id

new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Shinya Tawata"
params[:leader] = false
params[:leader_id] = leaders.sample.id

new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Aki"
params[:leader] = false
params[:leader_id] = leaders.sample.id

new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

puts "Users created"


puts "creating tasks"

params = {}
params[:description] =
params[:duration] =
new

puts "tasks created"
