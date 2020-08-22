desc 'Destroy all nurse tasks'
task :reinitialize do
  NurseTask.destroy_all
end
puts "Done"
