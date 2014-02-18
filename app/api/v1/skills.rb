module V1
  class Skills < Grape::API
    helpers APICommonHelpers

    namespace 'skills' do
      desc 'Получить все умения'
      get '/', jbuilder: 'v1/skills/index' do
        @skills = Skill.all
      end

      desc 'Создать умение'
      params do
        optional :title, type: String, desc: 'Название'
        optional :description, type: String, desc: 'Описание'
        optional :attrs, type: Hash, desc: 'Атрибуты'
      end
      post '/', jbuilder: 'v1/skills/show' do
        @skill = try_create!(Skill, :title, :description, :attrs)
      end
    end

    params do
      requires :id, type: Integer, desc: 'Идентификатор умения'
    end
    namespace 'skills/:id' do
      before do
        @skill = try_find(Skill, :id)
      end

      desc 'Получить умение по идентификатору'
      get '/', jbuilder: 'v1/skills/show'

      desc 'Обновить умение'
      params do
        optional :title, type: String, desc: 'Название'
        optional :description, type: String, desc: 'Описание'
        optional :attrs, type: Hash, desc: 'Атрибуты'
      end
      put '/', jbuilder: 'v1/skills/show' do
        update!(@skill, :title, :description, :attrs)
      end

      desc 'Удалить умение'
      delete '/' do
        destroy!(@skill)
      end
    end
  end
end
