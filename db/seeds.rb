# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning up start"
TaskTemplate.destroy_all
NurseTask.destroy_all
Patient.destroy_all
Doctor.destroy_all
Task.destroy_all
User.where.not(leader_id: nil).destroy_all
User.destroy_all
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
params[:duration] = 10
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] ="BS check"
params[:duration] = 5
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] ="IV"
params[:duration] = 5
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] ="Dr.round"
params[:duration] = 15
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] ="Meds"
params[:duration] = 5
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] ="Family conference"
params[:duration] = 30
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Lunch"
params[:duration] = 30
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Lunch break"
params[:duration] = 50
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Meeting"
params[:duration] = 5
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Urinary volume check"
params[:duration] = 5
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Operation"
params[:duration] = 15
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Admission"
params[:duration] = 30
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Discharge"
params[:duration] = 30
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Diaper"
params[:duration] = 5
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Shower"
params[:duration] = 20
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Change gown"
params[:duration] = 10
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Bed bath"
params[:duration] = 20
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Walk"
params[:duration] = 20
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Wound care"
params[:duration] = 20
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"


puts "Tasks created"

puts "creating users"
params = {}
params[:name] = "Linlu Liu"
params[:email] = "linlu@medisafe.com"
params[:password] = "password"
linlu = User.new(params)
linlu.save
puts "Created user #{linlu.id}"

params = {}
params[:name] = "Hayato Clarke"
params[:email] = "hayato@medisafe.com"
params[:password] = "password"
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
params[:email] = "yurie@medisafe.com"
params[:password] = "password"
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Wanying Kwok"
params[:leader] = linlu
params[:email] = "farrah@medisafe.com"
params[:password] = "password"
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Shinya Tawata"
params[:leader] = linlu
params[:email] = "shinya@medisafe.com"
params[:password] = "password"
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Aki"
params[:leader] = linlu
params[:email] = "aki@medisafe.com"
params[:password] = "password"
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

# ---------------------------------------------
# Task template
# frequency patient(ref) active task(ref)

puts "Creating task templates"
Patient.all.each do |patient|
  8.times do
    params = {}
    params[:frequency] = rand(1..3)
    params[:patient] = patient
    params[:active] = true
    params[:task] = Task.all.sample
    new_task_template = TaskTemplate.new(params)
    puts "Created task template #{new_task_template.id}" if new_task_template.save
  end
end
puts "Finished creating task templates"

# ---------------------------------------------
# Nurse tasks
# note completed(default false) task_template(ref) user_id(ref)

puts "Creating nurse tasks"
TaskTemplate.all.each do |task_template|
  params = {}
  params[:user] = User.where.not(leader_id: nil).sample
  params[:task_template] = task_template
  params[:completed] = false
  task_template.frequency.times do
    new_nurse_task = NurseTask.new(params)
    if new_nurse_task.save
      puts "Created nurse task #{new_nurse_task.id}"
    else
      puts new_nurse_task.errors.messages
    end
  end
end
puts "Finished creating nurse tasks"
