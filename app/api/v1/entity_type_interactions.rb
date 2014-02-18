module V1
  class EntityTypeInteractions < Grape::API
    helpers APICommonHelpers

    params do
      requires :entity_type_id, type: Integer, desc: 'Идентификатор типа сущности'
    end
    namespace 'entities/:entity_type_id/interactions' do
      before do
        @entity_type = try_find(EntityType, :id, :entity_type_id)
      end

      desc 'Получить все доступные взаимодействия для типа сущности'
      get '/', jbuilder: 'v1/entity_type_interactions/index' do
        @entity_type.interactions
      end

      desc 'Добавить взаимодействие'
      params do
        requires :interaction_id, type: Integer, desc: 'Идентификатор взаимодействия'
      end
      post '/', jbuilder: 'v1/entity_type_interactions/show' do
        try_save!(EntityTypeInteraction.new({
          :entity_type_id => @entity_type.id,
          :interaction_id => safe_params[:interaction_id]
        }))
      end
    end

    params do
      requires :id, type: Integer, desc: 'Идентификатор взаимодействия с типом сущности'
    end
    namespace 'entity_type_interactions/:id' do
      before do
        @entity_type_interaction = try_find(EntityTypeInteraction, :id)
      end

      # TODO: think 'bount & impl.
    end
  end
end
