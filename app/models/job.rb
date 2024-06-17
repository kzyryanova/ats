# frozen_string_literal: true

class Job < ApplicationRecord
  ACTIVATED_TYPE = "Events::Job::Activated"
  ACTIVATED = "Activated"
  DEACTIVATED = "Deactivated"

  has_many :applications, dependent: :destroy
  has_many :events, -> { order(created_at: :asc) }, class_name: "Events::Job::BaseEvent", dependent: :destroy
  
  def status
    events.last&.type == ACTIVATED_TYPE ? ACTIVATED : DEACTIVATED
  end

  def hire_count
    applications.select { |application| application.hired? }.count
  end

  def rejected_count
    applications.select { |application| application.rejected? }.count
  end

  def ongoing_count
    applications.select { |application| application.ongoing? }.count
  end
end
