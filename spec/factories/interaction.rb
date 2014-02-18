FactoryGirl.define do
  factory :interaction do
    title { generate(:title) }
    description { generate(:description) }
  end
end
