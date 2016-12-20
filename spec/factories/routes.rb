FactoryGirl.define do
  factory :route do
    id SecureRandom.hex
    agency_id FactoryGirl.create(:agency).id
  end
end
