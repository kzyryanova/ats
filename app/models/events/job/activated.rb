class Events::Job::Activated < Events::Job::BaseEvent
  data_attributes :job_id

  def apply(job)
    job.activated = true

    job
  end
end
