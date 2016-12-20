FactoryGirl.define do
  factory :stop_time do
    id { SecureRandom.uuid }
    trip
  end
end
