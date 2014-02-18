json.characteristics @characteristics do |characteristic|
  json.partial! 'v1/characteristics/model', characteristic: characteristic
end
