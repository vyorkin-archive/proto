FactoryGirl.define do
  factory :entity do
    association :type, factory: :entity_type
    attrs { generate(:hash) }
    longitude { generate(:longitude) }
    latitude { generate(:latitude) }
  end
end
