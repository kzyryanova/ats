json.array! @applications do |application|
  json.job_title application.job.title
  json.candidate_name application.candidate_name
  json.status application.events.reject { |a| a.type == "Events::Application::Note" }.last&.type || "Applied"
  json.notes_count application.events.select { |a| a.type == "Events::Application::Note" }.count
  json.interview_date application.events.select { |a| a.type == "Events::Application::Interview" }.last&.data
end