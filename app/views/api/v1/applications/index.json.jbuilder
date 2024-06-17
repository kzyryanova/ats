json.array! @applications do |application|
  json.job_title application.job_title
  json.candidate_name application.candidate_name
  json.status application.status
  json.notes_count application.notes_count
  json.interview_date application.interview_date
end
