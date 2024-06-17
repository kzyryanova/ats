FactoryBot.define do
  factory :application do
    sequence(:candidate_name) { |i| "Candidate #{i} name" }
    job
  end
end
