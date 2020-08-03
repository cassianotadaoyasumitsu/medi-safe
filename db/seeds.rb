# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning up start"
Doctor.destroy_all
Patient.destroy_all
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

puts "creating tasks"
params = {}
params[:description] = "VS check"
params[:duration] = "10mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] ="BS check"
params[:duration] ="5mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] ="IV"
params[:duration] ="5mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] ="Dr.round"
params[:duration] ="15mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] ="Meds"
params[:duration] ="5mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] ="Family conference"
params[:duration] = "30mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Lunch"
params[:duration] ="30mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Lunch break"
params[:duration] = "1H"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Meeting"
params[:duration] = "5mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Urinary volume check"
params[:duration] = "5mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Operation"
params[:duration] = "15mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Admission"
params[:duration] = "30mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Discharge"
params[:duration] = "30mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Diper"
params[:duration] = "5mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Shower"
params[:duration] = "20mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Change gown"
params[:duration] = "10mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Bed bath"
params[:duration] = "20mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Walk"
params[:duration] = "20mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Wund care"
params[:duration] = "20mins"
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"


puts "Tasks created"
