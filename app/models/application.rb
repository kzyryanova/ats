class Application < ApplicationRecord
  belongs_to :job
  has_many :events, class_name: "Events::Application::BaseEvent", dependent: :destroy
end
