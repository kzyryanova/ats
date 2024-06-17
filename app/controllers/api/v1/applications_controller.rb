class Api::V1::ApplicationsController < ApplicationController
  def index
    @applications = Application.includes(:job, :events).where("jobs.activated": true)
  end
end
