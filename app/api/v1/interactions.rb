module V1
  class Interactions < Grape::API
    helpers APICommonHelpers

    namespace 'interactions' do
      desc 'Получить все взаимодействия'
      get '/', jbuilder: 'v1/interactions/index' do
        @interactions = Interaction.all
      end

      desc 'Создать взаимодействие'
      params do
        requires :title, type: String, desc: 'Название'
        optional :description, type: String, desc: 'Описание'
      end
      post '/', jbuilder: 'v1/interactions/show' do
        @interaction = try_create!(Interaction, :title, :description)
      end
    end

    params do
      requires :id, type: Integer, desc: 'Идентификатор взаимодействия'
    end
    namespace 'interactions/:id' do
      before do
        @interaction = try_find(Interaction, :id)
      end

      desc 'Получить взаимодействие по идентификатору'
      get '/', jbuilder: 'v1/interactions/show'

      desc 'Обновить взаимодействие'
      params do
        optional :title, type: String, desc: 'Название'
        optional :description, type: String, desc: 'Описание'
      end
      put '/', jbuilder: 'v1/interactions/show' do
        update!(@interaction, :title, :description)
      end

      desc 'Удалить взаимодействие'
      delete '/' do
        destroy!(@interaction)
      end
    end
  end
end
