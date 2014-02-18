FactoryGirl.define do
  factory :entity_type do
    name { generate(:name) }
    description { generate(:description) }
    attrs { generate(:hash) }
  end
end
