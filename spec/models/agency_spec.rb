require 'rails_helper'

RSpec.describe Agency, type: :model do
  it { should have_many(:routes) }
end
