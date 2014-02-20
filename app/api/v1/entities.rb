module V1
  class Entities < Grape::API
    helpers APICommonHelpers

    namespace 'entities' do
      desc 'Получить все сущности'
      get '/', jbuilder: 'v1/entities/index' do
        @entities = Entity.all
      end
    end

    params do
      requires :id, type: Integer, desc: 'Идентификатор сущности'
    end
    namespace 'entities/:id' do
      before do
        @entity = try_find(Entity, :id)
      end

      desc 'Получить сущность по идентификатору'
      get '/', jbuilder: 'v1/entities/show'

      desc 'Обновить сущность'
      params do
        optional :attrs, type: Hash, desc: 'Атрибуты'
        optional :latitude, type: BigDecimal, desc: 'Широта'
        optional :longitude, type: BigDecimal, desc: 'Долгота'
      end
      put '/', jbuilder: 'v1/entities/show' do
        update!(@entity, :attrs, :latitude, :longitude)
      end

      desc 'Удалить сущность'
      delete '/' do
        destroy!(@entity)
      end
    end

    params do
      requires :entity_type_id, type: Integer, desc: 'Идентификатор типа сущности'
    end
    namespace '/entity_types/:entity_type_id/entities' do
      before do
        @entity_type = try_find(EntityType, :id, :entity_type_id)
      end

      desc 'Получить все сущности указанного типа'
      get '/', jbuilder: 'v1/entities/index' do
        @entities = Entity.of_type(@entity_type)
      end

      desc 'Создать сущность'
      params do
        optional :attrs, type: Hash, desc: 'Атрибуты'
        optional :latitude, type: BigDecimal, desc: 'Широта'
        optional :longitude, type: BigDecimal, desc: 'Долгота'
      end
      post '/', jbuilder: 'v1/entities/show' do
        @entity = try_create!(Entity,
          :entity_type_id, :attrs,
          :latitude, :longitude
        )
      end
    end
  end
end
