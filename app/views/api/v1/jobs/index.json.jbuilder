json.array! @jobs do |job|
  json.title job.title
  json.status job.status
  json.hired job.hire_count
  json.rejected job.rejected_count
  json.ongoing job.ongoing_count
end
