# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning up start"
NurseTask.destroy_all
TaskTemplate.destroy_all
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

SPECIALTIES = %w( gastroenterologists pulmonologists surgeon )
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
EMERGENCY = ['Low Care', 'Medium Care', 'High Care']
puts "Creating patients"
PATIENTS = [{name: "Yann Klein",
              gender: "male",
              room:"303",
              bed: "01"},
            {name: "Trouni Tiet",
              gender: "male",
              room:"303",
              bed: "02"},
            {name: "Doug Berkley",
              gender: "male",
              room:"303",
              bed: "03"},
            {name: "Paulo D'Alberti",
              gender: "male",
              room:"303",
              bed: "04"},
            {name: "Sasha Kaverina",
              gender: "female",
              room:"305",
              bed: "01"},
            {name: "Yurie Shiotani",
              gender: "female",
              room:"305",
              bed: "02"},
            {name: "Farrah Kwok",
              gender: "female",
              room:"305",
              bed: "03"},
            {name: "Yu Ichikawa",
              gender: "female",
              room:"305",
              bed: "04"},
            {name: "Ugo Bataillard",
              gender: "male",
              room:"306",
              bed: "01"},
            {name: "Sylvain Pierre",
              gender: "male",
              room:"306",
              bed: "02"},
            {name: "Florian Bronnimann",
              gender: "male",
              room:"306",
              bed: "03"},
            {name: "Hayato Clarke",
              gender: "male",
              room:"306",
              bed: "04"},
            {name: "Aki Aki",
              gender: "male",
              room:"307",
              bed: "01"},
            {name: "Shinya Tawata",
              gender: "male",
              room:"307",
              bed: "02"},
            {name: "Andrew Godeke",
              gender: "male",
              room:"307",
              bed: "03"},
            {name: "Ryuta Mizoguchi",
              gender: "male",
              room:"307",
              bed: "04"},
            {name: "Maria Kimie",
              gender: "female",
              room:"308",
              bed: "01"},
            {name: "Markie Choi",
              gender: "female",
              room:"308",
              bed: "02"},
            {name: "Olivia Mieko",
              gender: "female",
              room:"308",
              bed: "03"},
            {name: "Carise Stael",
              gender: "female",
              room:"308",
              bed: "04"}]
PATIENTS.each do |patient|
  params = {}
  params[:name] = patient[:name]
  params[:gender] = patient[:gender]
  params[:age] = rand(15..80)
  params[:room] = patient[:room]
  params[:bed] = patient[:bed]
  params[:severity] = EMERGENCY.sample
  params[:doctor] = Doctor.all.sample
  params[:emr_id] = Faker::Number.number(digits: 4)
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
params[:name] = "Tadao Yasumitsu"
params[:email] = "cassiano@medisafe.com"
params[:password] = "password"
cassiano = User.new(params)
cassiano.save
puts "Created user #{cassiano.id}"

params = {}
params[:name] = "Linlu Liu"
params[:email] = "linlu@medisafe.com"
params[:password] = "password"
params[:leader] = cassiano
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Davide Zanetto"
params[:leader] = cassiano
params[:email] = "davide@medisafe.com"
params[:password] = "password"
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Liam Baker"
params[:leader] = cassiano
params[:email] = 'liam@medisafe.com'
params[:password] = 'password'
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Ayako Amano"
params[:leader] = cassiano
params[:email] = "ayako@medisafe.com"
params[:password] = "password"
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

puts "Users created"

# ---------------------------------------------
# Task template
# frequency patient(ref) active task(ref)

puts "Creating task templates and nurse tasks"
Patient.all.each do |patient|
  Array(4..8).sample.times do
    params = {}
    params[:task] = Task.all.sample
    if ["Lunch", "BS check", "Dr.round", "Family conference", "Shower", "Change gown", "Bed bath", "Wound care", "Walk"].include?(params[:task].description)
      params[:frequency] = 1
    else
      params[:frequency] = [1,1,1,1,1,1,2,2].sample
    end
    params[:patient] = patient
    params[:active] = true

    new_task_template = TaskTemplate.new(params)
    puts "Created task template #{new_task_template.id}" if new_task_template.save
  end
end
puts "Finished creating task templates and nurse tasks"
