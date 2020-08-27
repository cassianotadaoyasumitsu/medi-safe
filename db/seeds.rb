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
              severity:'Low Care'},
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
              severity:'Medium Care'},
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
vs_check = Task.new(params)
vs_check.save
puts "Created task #{vs_check.id}"

params = {}
params[:description] ="BS check"
params[:duration] = 5
blood_sugar = Task.new(params)
blood_sugar.save
puts "Created task #{blood_sugar.id}"

params = {}
params[:description] ="IV"
params[:duration] = 5
iv = Task.new(params)
iv.save
puts "Created task #{iv.id}"

params = {}
params[:description] ="Dr.round"
params[:duration] = 15
dr_round = Task.new(params)
dr_round.save
puts "Created task #{dr_round.id}"

params = {}
params[:description] ="Meds"
params[:duration] = 5
meds = Task.new(params)
meds.save
puts "Created task #{meds.id}"

params = {}
params[:description] ="Family conference"
params[:duration] = 30
conference = Task.new(params)
conference.save
puts "Created task #{conference.id}"

params = {}
params[:description] = "Feeding"
params[:duration] = 30
feeding = Task.new(params)
feeding.save
puts "Created task #{feeding.id}"

params = {}
params[:description] = "Urinary volume check"
params[:duration] = 5
urine = Task.new(params)
urine.save
puts "Created task #{urine.id}"

params = {}
params[:description] = "Operation"
params[:duration] = 15
operation = Task.new(params)
operation.save
puts "Created task #{operation.id}"

params = {}
params[:description] = "Suction"
params[:duration] = 5
suction = Task.new(params)
suction.save
puts "Created task #{suction.id}"

params = {}
params[:description] = "Catheter"
params[:duration] = 15
catheter = Task.new(params)
catheter.save
puts "Created task #{catheter.id}"

params = {}
params[:description] = "Diaper"
params[:duration] = 5
diaper = Task.new(params)
diaper.save
puts "Created task #{diaper.id}"

params = {}
params[:description] = "Shower"
params[:duration] = 20
shower = Task.new(params)
shower.save
puts "Created task #{shower.id}"

params = {}
params[:description] = "Change gown"
params[:duration] = 10
gown = Task.new(params)
gown.save
puts "Created task #{gown.id}"

params = {}
params[:description] = "Bed bath"
params[:duration] = 20
bed_bath = Task.new(params)
bed_bath.save
puts "Created task #{bed_bath.id}"

params = {}
params[:description] = "Walk"
params[:duration] = 20
walk = Task.new(params)
walk.save
puts "Created task #{walk.id}"

params = {}
params[:description] = "Wound care"
params[:duration] = 20
wound = Task.new(params)
wound.save
puts "Created task #{wound.id}"

params = {}
params[:description] = "Blood draw"
params[:duration] = 5
blood = Task.new(params)
blood.save
puts "Created task #{blood.id}"

params = {}
params[:description] = "Skin treatment"
params[:duration] = 10
skin = Task.new(params)
skin.save
puts "Created task #{skin.id}"


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
ayako = User.new(params)
ayako.save
puts "Created user #{ayako.id}"

puts "Users created"

# ---------------------------------------------
# Task template
# frequency patient(ref) active task(ref)
puts "Creating task templates"
yann = Patient.where(name: "Yann Klein").first
params = {}
params[:task] = blood_sugar
params[:frequency] = 1
params[:patient] = yann
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params = {}
params[:task] = feeding
params[:frequency] = 1
params[:patient] = yann
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params = {}
params[:task] = blood
params[:frequency] = 1
params[:patient] = yann
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params = {}
params[:task] = wound
params[:frequency] = 1
params[:patient] = yann
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params = {}
params[:task] = walk
params[:frequency] = 1
params[:patient] = yann
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save

trouni = Patient.where(name: "Trouni Tiet").first
params = {}
params[:task] = blood_sugar
params[:frequency] = 1
params[:patient] = trouni
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params = {}
params[:task] = bed_bath
params[:frequency] = 1
params[:patient] = trouni
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params = {}
params[:task] = feeding
params[:frequency] = 1
params[:patient] = trouni
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params = {}
params[:task] = shower
params[:frequency] = 1
params[:patient] = trouni
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params = {}
params[:task] = diaper
params[:frequency] = 1
params[:patient] = trouni
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params[:task] = catheter
params[:frequency] = 1
params[:patient] = trouni
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save


doug = Patient.where(name: "Doug Berkley").first
params = {}
params[:task] = blood_sugar
params[:frequency] = 1
params[:patient] = doug
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params = {}
params[:task] = operation
params[:frequency] = 1
params[:patient] = doug
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params = {}
params[:task] = vs_check
params[:frequency] = 1
params[:patient] = doug
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params = {}
params[:task] = urine
params[:frequency] = 1
params[:patient] = doug
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params = {}
params[:task] = feeding
params[:frequency] = 1
params[:patient] = doug
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params[:task] = conference
params[:frequency] = 1
params[:patient] = doug
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save

ugo = Patient.where(name: "Ugo Bataillard").first
params = {}
params[:task] = blood_sugar
params[:frequency] = 1
params[:patient] = ugo
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params = {}
params[:task] = feeding
params[:frequency] = 1
params[:patient] = ugo
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params = {}
params[:task] = dr_round
params[:frequency] = 1
params[:patient] = ugo
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params = {}
params[:task] = iv
params[:frequency] = 1
params[:patient] = ugo
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params = {}
params[:task] = vs_check
params[:frequency] = 1
params[:patient] = ugo
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save
params[:task] = conference
params[:frequency] = 1
params[:patient] = ugo
params[:active] = true
new_task_template = TaskTemplate.new(params)
new_task_template.save


Patient.all.where.not(name: ['Yann Klein', 'Trouni Tiet', 'Doug Berkley', 'Ugo Bataillard']).each do |patient|
  params = {}
  params[:task] = blood_sugar
  params[:frequency] = 1
  params[:patient] = patient
  params[:active] = true
  new_task_template = TaskTemplate.new(params)
  Array(4..7).sample.times do
    params = {}
    params[:task] = Task.all.sample
    if ["Urinary volume check", "VS check", "Suction", "Diaper"].include?(params[:task].description)
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
puts "Finished creating task templates"
