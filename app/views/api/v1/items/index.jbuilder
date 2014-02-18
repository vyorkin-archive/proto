json.items @items do |item|
  json.partial! 'v1/items/model', item: item
end
