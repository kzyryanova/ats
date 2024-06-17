FactoryBot.define do
  factory :job_event, class: "Events::Job::BaseEvent" do
    job
  end
end
