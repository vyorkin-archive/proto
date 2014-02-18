module V1
  class ItemTypes < Grape::API
    helpers APICommonHelpers

    resource 'item_types' do
      desc 'Получить все типы предметов'
      get '/', jbuilder: 'v1/item_types/index' do
        @item_types = ItemType.all
      end

      desc 'Создать тип предмета'
      params do
        requires :name, type: String, desc: 'Название'
        optional :description, type: String, desc: 'Описание'
      end
      post '/', jbuilder: 'v1/item_types/show' do
        @item_type = try_create!(ItemType, :name, :description)
      end
    end

    params do
      requires :id, type: Integer, desc: 'Идентификатор'
    end
    namespace 'item_types/:id' do
      before do
        @item_type = try_find(ItemType, :id)
      end

      desc 'Получить тип предмета по идентификатору'
      get '/', jbuilder: 'v1/item_types/show'

      desc 'Обновить тип предмета'
      params do
        optional :name, type: String, desc: 'Название'
        optional :description, type: String, desc: 'Описание'
      end
      put '/', jbuilder: 'v1/item_types/show' do
        update!(@item_type, :id, :name, :description)
      end

      desc 'Удалить тип предмета'
      delete '/' do
        destroy!(@item_type)
      end
    end
  end
end
