class Events::Job::Deactivated < Events::Job::BaseEvent
  data_attributes :job_id

  def apply(job)
    job.activated = false
    
    job
  end
end
