json.item_types @item_types do |item_type|
  json.partial! 'v1/item_types/model', item_type: item_type
end
