json.player_characteristics @player_characteristics do |player_characteristic|
  json.partial! 'v1/player_characteristics/model', player_characteristic: player_characteristic
end
