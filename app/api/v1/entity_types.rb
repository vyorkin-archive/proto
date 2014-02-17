module V1
  class EntityTypes < Grape::API
    helpers APICommonHelpers

    resource :entity_types do
      desc 'Получить все типы сущностей'
      get '/', jbuilder: 'v1/entity_types/index' do
        @entity_types = EntityType.all
      end

      desc 'Получить тип сущности по идентификатору'
      params do
        requires :id, type: Integer, desc: 'Идентификатор'
      end
      get ':id', jbuilder: 'v1/entity_types/show' do
        @entity_type = try_find(EntityType, :id)
      end

      desc 'Создать тип сущности'
      params do
        requires :name, type: String, desc: 'Название'
        optional :description, type: String, desc: 'Описание'
      end
      post '/', jbuilder: 'v1/entity_types/show' do
        @entity_type = try_create!(EntityType, :name, :description)
      end

      desc 'Обновить тип сущности'
      params do
        requires :id, type: Integer, desc: 'Идентификатор'
        optional :name, type: String, desc: 'Название'
        optional :description, type: String, desc: 'Описание'
      end
      put ':id', jbuilder: 'v1/entity_types/show' do
        @entity_type = try_update!(EntityType, :id, :name, :description)
      end

      desc 'Удалить тип сущности'
      params do
        requires :id, type: Integer, desc: 'Идентификатор'
      end
      delete ':id' do
        try_find(EntityType, :id).destroy
      end
    end
  end
end
