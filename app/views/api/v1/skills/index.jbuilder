json.skills @skills do |skill|
  json.partial! 'v1/skills/model', skill: skill
end

