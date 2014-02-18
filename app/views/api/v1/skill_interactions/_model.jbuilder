json.extract! skill_interaction, :id
json.skill do
  json.partial! 'v1/skills/model', skill: skill_interaction.skill
end
json.interaction do
  json.partial! 'v1/interactions/model', interaction: skill_interaction.interaction
end
