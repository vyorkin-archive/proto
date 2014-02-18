json.players @players do |player|
  json.partial! 'v1/players/model', player: player
end
