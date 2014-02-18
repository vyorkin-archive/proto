module V1
  class EntityTypes < Grape::API
    helpers APICommonHelpers

    namespace 'entity_types' do
      desc 'Получить все типы сущностей'
      get '/', jbuilder: 'v1/entity_types/index' do
        @entity_types = EntityType.all
      end

      desc 'Создать тип сущности'
      params do
        requires :name, type: String, desc: 'Название'
        optional :description, type: String, desc: 'Описание'
      end
      post '/', jbuilder: 'v1/entity_types/show' do
        @entity_type = try_create!(EntityType, :name, :description)
      end
    end

    params do
      requires :id, type: Integer, desc: 'Идентификатор типа сущности'
    end
    namespace 'entity_types/:id' do
      before do
        @entity_type = try_find(EntityType, :id)
      end

      desc 'Получить тип сущности по идентификатору'
      get '/', jbuilder: 'v1/entity_types/show'

      desc 'Обновить тип сущности'
      params do
        optional :name, type: String, desc: 'Название'
        optional :description, type: String, desc: 'Описание'
      end
      put '/', jbuilder: 'v1/entity_types/show' do
        update!(@entity_type, :id, :name, :description)
      end

      desc 'Удалить тип сущности'
      delete '/' do
        destroy!(@entity_type)
      end
    end
  end
end
