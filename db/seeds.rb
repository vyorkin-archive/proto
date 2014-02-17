#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

characteristics = Characteristic.create! [
  { title: 'Усталость' }
]

entity_types = EntityType.create! [
  { name: 'building', description: 'Постройка' },
  { name: 'restaurant', description: 'Ресторан' },
  { name: 'саfe', description: 'Кафе' },
  { name: 'bank', description: 'Банк' },
  { name: 'police-station', description: 'Полицейский участок' },
  { name: 'fire-station', description: 'Пожарная станция' },
  { name: 'school', description: 'Школа' }
]

item_types = ItemType.create! [
  { name: 'bag', description: 'Рюкзак', attrs: { :capacity => 12 } },
  { name: 'bag_extended', description: 'Вместительный рюкзак', attrs: { :capacity => 24 } },
  { name: 'bread', description: 'Хлеб' }
]
