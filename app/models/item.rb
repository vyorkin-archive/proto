class Item < ActiveRecord::Base
  belongs_to :item_type

  scope :of_type, ->(item_type) {
    where(item_type_id: item_type.id)
  }
end
