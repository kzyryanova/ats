require "rails_helper"

RSpec.describe Job, type: :model do
  describe "associations" do
    it { should have_many(:events).class_name('Events::Job::BaseEvent') }
    it { should have_many(:applications).class_name('Application') }
  end
end
