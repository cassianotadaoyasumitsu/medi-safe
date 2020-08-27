# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

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

puts "Creating doctors"

params = {}
params[:name] = "Gregory House"
params[:contact] = "070-1224-5643"
params[:specialty] = "gastroenterologists"
new_doctor = Doctor.new(params)
puts "Created doctor #{new_doctor.id}" if new_doctor.save

params = {}
params[:name] = "Jekill Hide"
params[:contact] = "080-3138-9898"
params[:specialty] = "pulmonologists"
new_doctor = Doctor.new(params)
puts "Created doctor #{new_doctor.id}" if new_doctor.save

params = {}
params[:name] = "Frank Estain"
params[:contact] = "080-3445-4498"
params[:specialty] = "surgeon"
new_doctor = Doctor.new(params)
puts "Created doctor #{new_doctor.id}" if new_doctor.save

params = {}
params[:name] = "Do Little"
params[:contact] = "070-1644-5643"
params[:specialty] = "gastroenterologists"
new_doctor = Doctor.new(params)
puts "Created doctor #{new_doctor.id}" if new_doctor.save

params = {}
params[:name] = "Doubt Fire"
params[:contact] = "080-3138-9898"
params[:specialty] = "pulmonologists"
new_doctor = Doctor.new(params)
puts "Created doctor #{new_doctor.id}" if new_doctor.save

params = {}
params[:name] = "Truman Show"
params[:contact] = "080-3445-4498"
params[:specialty] = "surgeon"
new_doctor = Doctor.new(params)
puts "Created doctor #{new_doctor.id}" if new_doctor.save

puts "Finished creating doctors"

# ---------------------------------------------
# Patients
# name gender age severity room bed doctor
puts "Creating patients"
PATIENTS = [{name: "Yann Klein",
              gender: "male",
              room:"303",
              bed: "01",
              severity:'High Care'},
            {name: "Trouni Tiet",
              gender: "male",
              room:"303",
              bed: "02",
              severity:'Low Care'},
            {name: "Doug Berkley",
              gender: "male",
              room:"303",
              bed: "03",
              severity:'Low Care'},
            {name: "Paulo D'Alberti",
              gender: "male",
              room:"303",
              bed: "04",
              severity:'Low Care'},
            {name: "Sasha Kaverina",
              gender: "female",
              room:"305",
              bed: "01",
              severity:'Low Care'},
            {name: "Yurie Shiotani",
              gender: "female",
              room:"305",
              bed: "02",
              severity:'Medium Care'},
            {name: "Farrah Kwok",
              gender: "female",
              room:"305",
              bed: "03",
              severity:'High Care'},
            {name: "Yu Ichikawa",
              gender: "female",
              room:"305",
              bed: "04",
              severity:'Medium Care'},
            {name: "Ugo Bataillard",
              gender: "male",
              room:"306",
              bed: "01",
              severity:'Low Care'},
            {name: "Sylvain Pierre",
              gender: "male",
              room:"306",
              bed: "02",
              severity:'High Care'},
            {name: "Florian Bronnimann",
              gender: "male",
              room:"306",
              bed: "03",
              severity:'High Care'},
            {name: "Hayato Clarke",
              gender: "male",
              room:"306",
              bed: "04",
              severity:'Low Care'},
            {name: "Aki Aki",
              gender: "male",
              room:"307",
              bed: "01",
              severity:'Medium Care'},
            {name: "Shinya Tawata",
              gender: "male",
              room:"307",
              bed: "02",
              severity:'Medium Care'},
            {name: "Andrew Godeke",
              gender: "male",
              room:"307",
              bed: "03",
              severity:'Low Care'},
            {name: "Ryuta Mizoguchi",
              gender: "male",
              room:"307",
              bed: "04",
              severity:'Low Care'},
            {name: "Maria Kimie",
              gender: "female",
              room:"308",
              bed: "01",
              severity:'Low Care'},
            {name: "Markie Choi",
              gender: "female",
              room:"308",
              bed: "02",
              severity:'Low Care'},
            {name: "Olivia Mieko",
              gender: "female",
              room:"308",
              bed: "03",
              severity:'Low Care'},
            {name: "Carise Stael",
              gender: "female",
              room:"308",
              bed: "04",
              severity:'Low Care'}]

PATIENTS.each do |patient|
  params = {}
  params[:name] = patient[:name]
  params[:gender] = patient[:gender]
  params[:age] = rand(15..80)
  params[:room] = patient[:room]
  params[:bed] = patient[:bed]
  params[:severity] = patient[:severity]
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
params[:description] ="Doctors' rounds"
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
params[:description] ="Enema"
params[:duration] = 10
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Feeding"
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
params[:description] = "ENT suction"
params[:duration] = 5
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Catheter"
params[:duration] = 15
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
params[:description] = "Gown change"
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

params = {}
params[:description] = "Blood draw"
params[:duration] = 5
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Skin treatment"
params[:duration] = 10
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Chemotherapy"
params[:duration] = 50
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "X-ray"
params[:duration] = 25
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "MRI scan"
params[:duration] = 25
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "CT scan"
params[:duration] = 25
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Endoscopy"
params[:duration] = 25
new_task = Task.new(params)
new_task.save
puts "Created task #{new_task.id}"

params = {}
params[:description] = "Colonoscopy"
params[:duration] = 25
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
file = URI.open('https://avatars0.githubusercontent.com/u/42375242?s=460&u=eb9477bf6759426d9863aa10fdbfb550b97dbd0b&v=4')
cassiano.photo.attach(io: file, filename: 'cassiano.jpg', content_type: 'image/jpg')
cassiano.save
puts "Created user #{cassiano.id}"

params = {}
params[:name] = "Linlu Liu"
params[:email] = "linlu@medisafe.com"
params[:password] = "password"
params[:leader] = cassiano
new_user = User.new(params)
file = URI.open('https://avatars2.githubusercontent.com/u/60726285?s=460&u=c16b83e7ee4a56cbcea5a9f24e44f85d4aada08a&v=4')
new_user.photo.attach(io: file, filename: 'linlu.jpg', content_type: 'image/jpg')
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Davide Zanetto"
params[:leader] = cassiano
params[:email] = "davide@medisafe.com"
params[:password] = "password"
new_user = User.new(params)
file = URI.open('https://avatars1.githubusercontent.com/u/47884470?s=460&u=677d96087d7aef616d840f82db7e329b55ce72f4&v=4')
new_user.photo.attach(io: file, filename: 'davide.jpg', content_type: 'image/jpg')
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Liam Baker"
params[:leader] = cassiano
params[:email] = 'liam@medisafe.com'
params[:password] = 'password'
new_user = User.new(params)
file = URI.open('https://avatars0.githubusercontent.com/u/46614913?s=460&u=f15367ebb4bbed86502a170cf34571c48813fedc&v=4')
new_user.photo.attach(io: file, filename: 'liam.jpg', content_type: 'image/jpg')
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:name] = "Ayako Amano"
params[:leader] = cassiano
params[:email] = "ayako@medisafe.com"
params[:password] = "password"
new_user = User.new(params)
file = URI.open('https://avatars3.githubusercontent.com/u/60478784?s=460&u=a9239a74629208ad3a3fc4ae515d75ef30a0e698&v=4')
new_user.photo.attach(io: file, filename: 'ayako.jpg', content_type: 'image/jpg')
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
    if ["Urinary volume check", "VS check", "ENT Suction", "Diaper"].include?(params[:task].description)
      params[:frequency] = [1,1,1,1,1,1,2,2].sample
    else
      params[:frequency] = 1
    end
    params[:patient] = patient
    params[:active] = true

    new_task_template = TaskTemplate.new(params)
    puts "Created task template #{new_task_template.id}" if new_task_template.save
  end
end
puts "Finished creating task templates and nurse tasks"
