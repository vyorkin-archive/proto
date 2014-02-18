json.extact! player_skill, :id, :last_user_at
json.player do
  json.partial! 'v1/players/model', player: player_skill.player
end
json.skill do
  json.partial! 'v1/skills/model', skill: player_skill.skill
end
