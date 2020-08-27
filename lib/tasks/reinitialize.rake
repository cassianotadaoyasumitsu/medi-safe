desc 'Destroy all nurse tasks'

task :reinitialize do
  puts "Start destroying all nurse tasks..."
  NurseTask.destroy_all
  puts "...done"
  puts "Start resetting on_shift..."
  cassiano = User.where(leader_id: nil)[0]
  cassiano.on_shift = false
  cassiano.save
  puts "...done"
end
