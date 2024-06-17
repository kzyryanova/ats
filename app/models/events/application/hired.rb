class Events::Application::Hired < Events::Application::BaseEvent
  data_attributes :application_id, :hire_date

  def apply(application)
    application.hire_date = hire_date

    application
  end
end
