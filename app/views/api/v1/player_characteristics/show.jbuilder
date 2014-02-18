json.player_characteristic do
  json.partial! 'v1/player_characteristics/model', player_characteristic: @player_characteristic
end
