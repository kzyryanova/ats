namespace :job_events do
  desc "Seeds job events"
  # rake job_events:job_activate\[11\]
  # rake job_events:job_deactivate\[11\]
  
  task :job_activate, [:job_id] => :environment do |_, args|
    Events::Job::Activated.create(job_id: args[:job_id])
    
    puts "Job #{args[:job_id]} is activated!"
  end

  task :job_deactivate, [:job_id] => :environment do |_, args|
    Events::Job::Deactivated.create(job_id: args[:job_id])

    puts "Job #{args[:job_id]} is deactivated!"
  end
end
