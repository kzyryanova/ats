require "rails_helper"

RSpec.describe Application, type: :model do
  describe "associations" do
    it { should belong_to(:job).class_name('Job') }
    it { should have_many(:events).class_name('Events::Application::BaseEvent') }
  end
end
