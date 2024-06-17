require "rails_helper"

RSpec.describe "GET /applications", type: :request do
  context "when no application" do
    before { get api_v1_applications_path }

    it "responds with status 200" do
      expect(response).to have_http_status(:success)
    end

    it "renders empty array" do
      expect(response.body).to eq("[]")
    end
  end

  context "when job activated" do
    let(:job) { FactoryBot.create(:job, :job_activated) }

    let(:expected_response) do
      [
        {
          "job_title" => "Job title 1",
          "candidate_name" => "Candidate 1 name",
          "status" => "Applied",
          "notes_count" => 0,
          "interview_date" => nil
        }
      ]
    end

    it "renders a list of applications with required attributes" do
      FactoryBot.create(:application, job: job)

      get api_v1_applications_path
      expect(JSON.parse(response.body)).to eq(expected_response)
    end
  end
end
