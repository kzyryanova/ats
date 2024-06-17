class Events::Application::BaseEvent < Events::BaseEvent
  self.table_name = "application_events"

  belongs_to :application, class_name: "::Application"
end
