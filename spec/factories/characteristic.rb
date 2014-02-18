FactoryGirl.define do
  factory :characteristic do
    title { generate(:title) }
    description { generate(:description) }
    attrs { generate(:hash) }
  end
end
