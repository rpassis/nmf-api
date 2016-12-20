require 'rails_helper'

RSpec.describe Route, type: :model do
  it { should belong_to(:agency) }
  it { should have_many(:trips) }
end
