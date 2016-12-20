require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should have_many(:stop_times) }
  it { should belong_to(:route) }
end
