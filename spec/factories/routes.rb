FactoryGirl.define do
  factory :route do
    id SecureRandom.hex
    agency FactoryGirl.create(:agency)
  end
end
