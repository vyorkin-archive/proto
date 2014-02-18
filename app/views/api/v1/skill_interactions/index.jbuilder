json.skill_interactions @skill_interactions do |skill_interaction|
  json.partial! 'v1/skill_interactions/model', skill_interaction: skill_interaction
end
