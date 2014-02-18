FactoryGirl.define do
  factory :skill do
    title { generate(:title) }
    description { generate(:description) }
    attrs { generate(:hash) }
  end
end
