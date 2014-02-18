module V1
  class PlayerSkills < Grape::API
    helpers APICommonHelpers

    namespace 'players/:player_id/skills' do
      before do
        @player = try_find(Player, :id, :player_id)
      end

      desc 'Получить все умения игрока'
      get '/', jbuilder: 'v1/player_skills/index' do
        @player.skills
      end

      desc 'Добавить умение'
      params do
        requires :skill_id, type: Integer, desc: 'Идентификатор умения'
      end
      post '/', jbuilder: 'v1/player_skills/show' do
        try_save!(PlayerSkill.new({
          :player_id => @player.id,
          :skill_id  => safe_params[:skill_id]
        }))
      end
    end

    params do
      requires :id, type: Integer, desc: 'Идентификатор умения игрока'
    end
    namespace 'player_skills/:id' do
      before do
        @player_skill = try_find(PlayerSkill, :id)
      end

      desc 'Обновить время последнего использования умения'
      params do
        requires :time, type: DateTime, desc: 'Время последнего использования'
      end
      put '/use' do
        try_update!(@player_skill, :id, :time)
        status 204
      end

      desc 'Получить время последнего использования'
      get '/last_used' do
        @player_skill.last
      end

      desc 'Удалить умение'
      delete '/' do
        destroy!(@player_skill)
      end
    end
  end
end
