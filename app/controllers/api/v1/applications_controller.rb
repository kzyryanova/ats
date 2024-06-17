class Api::V1::ApplicationsController < ApplicationController
  def index
    @applications = Application.includes(:job).where("jobs.activated": false)
  end
end
