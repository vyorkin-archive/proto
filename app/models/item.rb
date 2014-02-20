class Item < ActiveRecord::Base
  belongs_to :type, class_name: 'ItemType',
             foreign_key: 'item_type_id'

  scope :of_type, ->(item_type) {
    where(item_type_id: item_type.id)
  }
end
