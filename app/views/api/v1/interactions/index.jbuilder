json.interactions @interactions do |interaction|
  json.partial! 'v1/interactions/model', interaction: interaction
end

