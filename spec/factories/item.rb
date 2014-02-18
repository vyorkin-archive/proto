FactoryGirl.define do
  factory :item do
    association :type, factory: :item_type
    attrs { generate(:hash) }
  end
end
