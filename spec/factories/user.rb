FactoryGirl.define do
  factory :user do
    email { generate(:email) }
  end
end
