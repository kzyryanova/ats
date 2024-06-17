class Job < ApplicationRecord
  has_many :applications, dependent: :destroy
  has_many :events, class_name: "Events::Job::BaseEvent", dependent: :destroy
end
