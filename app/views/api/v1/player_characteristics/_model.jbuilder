json.extract! player_characteristic, :id, :value
json.player do
  json.partial! 'v1/players/model', player: player_skill.player
end
json.characteristic do
  json.partial! 'v1/characteristics/model', characteristic: player_characteristic.characteristic
end
