require "rails_helper"

RSpec.describe Api::V1::ApplicationsController, type: :controller do
  render_views

  describe "GET index" do
    it "renders the index template" do
      get :index, format: :json

      expect(response).to have_http_status(:success)
    end
  end
end