module V1
  class Items < Grape::API
    helpers APICommonHelpers

    namespace 'items' do
      desc 'Получить все предметы'
      get '/', jbuilder: 'v1/items/index' do
        @items = Item.all
      end
    end

    params do
      requires :id, type: Integer, desc: 'Идентификатор предмета'
    end
    namespace 'items/:id' do
      before do
        @item = try_find(Item, :id)
      end

      desc 'Получить предмет по идентификатору'
      get '/', jbuilder: 'v1/items/show'

      desc 'Обновить предмет'
      params do
        optional :attrs, type: Hash, desc: 'Атрибуты'
      end
      put '/', jbuilder: 'v1/items/show' do
        update!(@item, :attrs)
      end

      desc 'Удалить предмет'
      delete '/' do
        destroy!(@item)
      end
    end

    params do
      requires :item_type_id, type: Integer, desc: 'Идентификатор типа предмета'
    end
    namespace 'item_types/:item_type_id/items' do
      before do
        @item_type = try_find(ItemType, :id, :item_type_id)
      end

      desc 'Получить все предметы указанного типа'
      get '/', jbuilder: 'v1/items/index' do
        @items = Item.of_type(@item_type)
      end

      desc 'Создать предмет'
      params do
        optional :attrs, type: Hash, desc: 'Атрибуты'
      end
      post '/', jbuilder: 'v1/items/show' do
        @item = try_create!(Item, :item_type_id, :attrs)
      end
    end
  end
end

