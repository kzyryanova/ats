class Events::Application::Rejected < Events::Application::BaseEvent
  data_attributes :application_id

  def apply(application)
    application.rejected = true

    application
  end
end
