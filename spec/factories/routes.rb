FactoryGirl.define do
  factory :route do
    id { SecureRandom.hex }
    agency
  end
end
