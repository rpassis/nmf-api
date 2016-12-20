require 'rails_helper'

RSpec.describe StopTime, type: :model do
  it { should have_many(:stops) }
  it { should belong_to(:trip) }
end
