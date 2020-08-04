# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




puts "Cleaning up start"
Patient.destroy_all
User.destroy_all
Doctor.destroy_all
puts "Cleaning up done"

# ---------------------------------------------
# Doctors
# name contact specialty
require 'faker'

SPECIALTIES = %w( gastroenterologists pulmonologists gynecologists surgeon )
puts "Creating doctors"
6.times do
  params = {}
  params[:name] = Faker::Name.name
  params[:contact] = Faker::PhoneNumber.cell_phone
  params[:specialty] = SPECIALTIES.sample
  new_doctor = Doctor.new(params)
  puts "Created doctor #{new_doctor.id}" if new_doctor.save
end
puts "Finished creating doctors"

# ---------------------------------------------
# Patients
# name gender age severity room bed doctor
GENDERS = %w( male female )
EMERGENCY = ['Low Care', 'Medium Care', 'High Care']
puts "Creating patients"
30.times do
  params = {}
  params[:name] = Faker::Name.name
  params[:gender] = GENDERS.sample
  params[:age] = rand(15..80)
  params[:room] = "#{rand(1..7)}#{rand(0..1)}#{rand(1..9)}"
  params[:bed] = "0#{rand(1..8)}"
  params[:severity] = EMERGENCY.sample
  params[:doctor] = Doctor.all.sample
  new_patient = Patient.new(params)
  puts "Created patient #{new_patient.id}" if new_patient.save
end
puts "Finished creating patients"

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
params[:name] = "Davide Zanetto"
params[:leader] = hayato
params[:email] = "davide@medisafe.com"
params[:password] = "password"
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Cassiano Yasumitsu"
params[:leader] = hayato
params[:email] = "cassiano@medisafe.com"
params[:password] = "password"
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Liam Baker"
params[:leader] = hayato
params[:email] = 'liam@medisafe.com'
params[:password] = 'password'
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
params[:email] = "ayako@medisafe.com"
params[:password] = "password"
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

puts "Users created"
