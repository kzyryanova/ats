# frozen_string_literal: true

class Application < ApplicationRecord
  HIRED = "Events::Application::Hired"
  REJECTED = "Events::Application::Rejected"
  INTERVIEW = "Events::Application::Interview"
  NOTE = "Events::Application::Note"
  APPLIED = "Applied"

  belongs_to :job
  has_many :events, -> { order(created_at: :asc) }, class_name: "Events::Application::BaseEvent", dependent: :destroy

  def job_title
    job.title
  end
  
  def status
    last_status = events.reject { |event| event.type == NOTE }.last&.type
    
    @status ||= last_status.present? ? last_status.split("::").last : APPLIED
  end

  def notes_count
    events.select { |event| event.type == NOTE }.count
  end

  def interview_date
    last_interview_event_data = events.select { |event| event.type == INTERVIEW }.last&.data

    last_interview_event_data.present? ? last_interview_event_data["interview_date"] : nil
  end

  def hired?
    status == HIRED.split("::").last
  end

  def rejected?
    status == REJECTED.split("::").last
  end

  def ongoing?
    [APPLIED, INTERVIEW.split("::").last].include?(status)
  end
end
