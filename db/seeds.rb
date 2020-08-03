# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



puts "creating users"
params = {}
params[:name] = "Linlu Liu"
linlu = User.new(params)
linlu.save
puts "Created user #{linlu.id}"

params = {}
params[:name] = "Hayato Clarke"
hayato = User.new(params)
hayato.save
puts "Created user #{hayato.id}"

params = {}
params[:name] = "Davide Zannet"
params[:leader] = hayato
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Cassiano Yasumitsu"
params[:leader] = hayato
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Liam Baker"
params[:leader] = hayato
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Yurie Shiotani"
params[:leader] = hayato
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Wanying Kwok"
params[:leader] = linlu
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Shinya Tawata"
params[:leader] = linlu
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Aki"
params[:leader] = linlu
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Ayako Amano"
params[:leader] = linlu
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

puts "Users created"

puts "creating tasks"
params = {}
params[:description] = "VS check"
params[:duration] = "10mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] =
params[:duration] =
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] =
params[:duration] =
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] =
params[:duration] =
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] =
params[:duration] =
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] =
params[:duration] =
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] =
params[:duration] =
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] =
params[:duration] =
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] =
params[:duration] =
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] =
params[:duration] =
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] =
params[:duration] =
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] =
params[:duration] =
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] =
params[:duration] =
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] =
params[:duration] =
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] =
params[:duration] =
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

puts "Tasks created"


