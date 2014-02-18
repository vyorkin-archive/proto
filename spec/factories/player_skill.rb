FactoryGirl.define do
  factory :player_skill do
    association :player
    association :skill
    last_used_at { generate(:datetime) }
  end
end
