class Api::V1::JobsController < ApplicationController
  def index
    @jobs = Job.includes(:events, applications: :events)
  end
end
