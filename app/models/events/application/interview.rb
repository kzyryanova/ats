class Events::Application::Interview < Events::Application::BaseEvent
  data_attributes :application_id, :interview_date

  def apply(application)
    application.interview_date = interview_date

    application
  end
end
