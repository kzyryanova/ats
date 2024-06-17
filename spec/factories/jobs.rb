FactoryBot.define do
  factory :job do
    sequence(:title) { |i| "Job title #{i}" }
    sequence(:description) { |i| "Description of job #{i}" }
  
    trait :job_activated do
      after :create do |job, _|
        Events::Job::Activated.create(job_id: job.id)
      end
    end
  end
end
