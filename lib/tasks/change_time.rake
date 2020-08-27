desc 'Modifies current time'
task :freeze_time do
  Timecop.freeze("8:45")
  puts Time.now
end

task :unfreeze_time do
  Timecop.return
end
