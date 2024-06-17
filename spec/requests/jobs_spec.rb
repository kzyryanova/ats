require "rails_helper"

RSpec.describe "GET /jobs", type: :request do
  context "when no jobs" do
    before { get api_v1_jobs_path }

    it "responds with status 200" do
      expect(response).to have_http_status(:success)
    end

    it "renders empty array" do
      expect(response.body).to eq("[]")
    end
  end

  context "when jobs exist" do
    before do
      FactoryBot.create(:job, title: "Job title test")
      get api_v1_jobs_path
    end

    let(:expected_response) do
      [
        {
          "title" => "Job title test",
          "status" => "Deactivated",
          "hired" => 0,
          "rejected" => 0,
          "ongoing" => 0
        }
      ]
    end

    it "renders a list of jobs with required attributes" do
      expect(JSON.parse(response.body)).to eq(expected_response)
    end
  end
end
