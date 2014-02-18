json.player_skills @player_skills do |player_skill|
  json.partial! 'v1/player_skills/model', player_skill: player_skill
end
