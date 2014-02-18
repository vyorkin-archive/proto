FactoryGirl.define do
  factory :item_type do
    name { generate(:name) }
    description { generate(:description) }
    attrs { generate(:hash) }
  end
end
