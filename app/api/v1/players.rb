module V1
  class Players < Grape::API
    helpers APICommonHelpers

    namespace 'players' do
      desc 'Получить всех игроков'
      get '/', jbuilder: 'v1/players/index' do
        @players = Player.all
      end

      desc 'Создать игрока'
      params do
        requires :user_id, type: Integer, desc: 'Идентификатор пользователя'
        optional :latitude, type: BigDecimal, desc: 'Широта'
        optional :longitude, type: BigDecimal, desc: 'Долгота'
      end
      puts '/', jbuilder: 'v1/players/show' do
        @player = try_create!(Player, :user_id, :latitude, :longitude)
      end
    end

    params do
      requires :id, type: Integer, desc: 'Идентификатор игрока'
    end
    namespace 'players/:id' do
      before do
        @player = try_find(Player, :id)
      end

      desc 'Получить игрока по идентификатору'
      get '/', jbuilder: 'v1/players/show'

      desc 'Обновить игрока'
      params do
        optional :latitude, type: BigDecimal, desc: 'Широта'
        optional :longitude, type: BigDecimal, desc: 'Долгота'
      end
      put '/', jbuilder: 'v1/players/show' do
        update!(Player, :latitude, :longitude)
      end

      desc 'Удалить игрока'
      delete '/' do
        destroy!(@player)
      end
    end
  end
end
