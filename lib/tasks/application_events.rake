namespace :application_events do
  desc "Seeds application events"
  # rake "application_events:interview[81, '16-05-2024']"
  
  task :interview, [:application_id, :interview_date] => :environment do |_, args|
    Events::Application::Interview.create(
      application_id: args[:application_id],
      interview_date: args[:interview_date]
    )
    
    puts "For application #{args[:application_id]} interview status has been added!"
  end

  task :hire, [:application_id, :hired_date] => :environment do |_, args|
    Events::Application::Hired.create(
      application_id: args[:application_id],
      hire_date: args[:hire_date]
    )
    
    puts "For application #{args[:application_id]} hire date has been added!"
  end

  task :reject, [:application_id] => :environment do |_, args|
    Events::Application::Rejected.create(
      application_id: args[:application_id]
    )
    
    puts "Application #{args[:application_id]} has been rejected!"
  end
end
