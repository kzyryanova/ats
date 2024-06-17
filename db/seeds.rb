# rails db:seed
Job.destroy_all
Application.destroy_all
Events::Job::BaseEvent.destroy_all
Events::Application::BaseEvent.destroy_all

100.times do
  Job.create!(
    title: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 0).chop,
    description: Faker::Lorem.paragraph
  )
end

p "Created #{Job.count} jobs"

5.times do
  Job.limit(80).pluck(:id).shuffle.each do |job_index|
    Events::Job::Activated.create(job_id: job_index) unless Job.find_by_id(job_index).activated
    
    Application.create!(
      candidate_name: Faker::Name.name,
      job_id: job_index
    )
  end
end

p "80 jobs activated, #{Application.count} applications have been created."

Application.limit(70).pluck(:id).shuffle.each do |application_index|
  Events::Application::Interview.create(
    application_id: application_index,
    interview_date: Faker::Time.between(from: 10.days.ago, to: 1.day.ago)
  )
end

p "20 applications got interview status"

Job.limit(3).offset(5).pluck(:id).shuffle.each do |job_index|
  Events::Job::Deactivated.create(job_id: job_index)
end

p "3 jobs has been deactivated"

Application.limit(10).pluck(:id).shuffle.each do |application_index|
  Events::Application::Hired.create(
    application_id: application_index,
    hire_date: Faker::Time.between(from: 10.days.ago, to: 1.day.ago)
  )
end

p "10 applications got hire status"

Application.limit(10).offset(10).pluck(:id).shuffle.each do |application_index|
  Events::Application::Rejected.create(
    application_id: application_index
  )
end

p "10 applications got rejected status"

3.times do
  Application.limit(20).pluck(:id).shuffle.each do |application_index|
    Events::Application::Note.create(
      application_id: application_index,
      note: Faker::Lorem.sentence(word_count: 10, supplemental: false, random_words_to_add: 0).chop
    )
  end
end

p "60 applications got a note"
