class Events::Application::Note < Events::Application::BaseEvent
  data_attributes :application_id, :note

  def apply(application)

    application
  end
end
