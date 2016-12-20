FactoryGirl.define do
  factory :trip do
    id { SecureRandom.uuid }
    route
  end
end
