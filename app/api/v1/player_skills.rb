module V1
  class PlayerSkills < Grape::API
    helpers APICommonHelpers

    namespace 'players/:player_id/skills' do
      before do
        @player = try_find(Player, :id, :player_id)
      end

      desc 'Получить все скилы игрока'
      get '/', jbuilder: 'v1/skills/index' do
        @player.skills
      end

      desc 'Добавить скилл'
      params do
      end
      post '/', jbuilder: 'v1/skills/show' do
      end

      desc 'Обновить умение'
      params do
      end
      put ':id', jbuilder: 'v1/skills/show' do
      end

      desc 'Удалить умение'
      params do
        requires :id, type: Integer, desc: 'Идентификатор'
      end
      delete ':id' do
        @player.skills.destroy(params[:id])
      end
    end
  end
end
