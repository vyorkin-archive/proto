FactoryGirl.define do
  factory :player do
    association :user
    latitude { generate(:latitude) }
    longitude { generate(:longitude) }
  end
end
