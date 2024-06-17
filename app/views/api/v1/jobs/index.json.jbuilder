json.array! @jobs do |job|
  json.title job.title
  json.status job.events.last&.type == "Events::Job::Activated" ? "Activated" : "Deactivated"
  json.hired job.applications.select { |a| a.events.pluck(:type).include? "Events::Application::Hired" }.count
  json.rejected job.applications.select { |a| a.events.pluck(:type).include? "Events::Application::Rejected" }.count
  json.ongoing job.applications.select { |a| a.events.empty? || (a.events.pluck(:type) & ["Events::Application::Interview", "Events::Application::Note"]).any? }.count
end
