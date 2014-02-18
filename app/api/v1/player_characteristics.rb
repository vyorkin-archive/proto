module V1
  class PlayerCharacteristics < Grape::API
    helpers APICommonHelpers

    namespace 'players/:player_id/characteristics' do
      before do
        @player = try_find(Player, :id, :player_id)
      end

      desc 'Получить все характеристики игрока'
      get '/', jbuilder: 'v1/player_characteristics/index' do
        @player.characteristics
      end

      desc 'Добавить характеристику игрока'
      params do
        requires :characteristic_id, type: Integer, desc: 'Идентификатор характеристики'
      end
      post '/', jbuilder: 'v1/player_characteristics/show' do
        try_save!(PlayerCharacteristic.new({
          :player_id => @player.id,
          :characteristic_id => safe_params[:characteristic_id]
        }))
      end
    end

    params do
      requires :id, type: Integer, desc: 'Идентификатор характеристики игрока'
    end
    namespace 'player_characteristics/:id' do
      before do
        @player_characteristic = try_find(PlayerCharacteristic, :id)
      end

      desc 'Обновить характеристику игрока'
      put '/' do
        update!(@player_characteristic, :value)
      end

      desc 'Удалить характеристику игрока'
      delete '/' do
        destroy!(@player_characteristic)
      end
    end
  end
end
