module V1
  class Characteristics < Grape::API
    helpers APICommonHelpers

    namespace 'characteristics' do
      desc 'Получить все характеристики'
      get '/', jbuilder: 'v1/characteristics/index' do
        @characteristics = Characteristic.all
      end

      desc 'Создать характеристику'
      params do
        requires :title, type: String, desc: 'Название'
        optional :description, type: String, desc: 'Описание'
        optional :attrs, type: Hash, desc: 'Атрибуты'
      end
      post '/', jbuilder: 'v1/characteristics/show' do
        @characteristic = try_create!(Characteristic,
          :title, :description, :attrs
        )
      end
    end

    params do
      requires :id, type: Integer, desc: 'Идентификатор характеристики'
    end
    namespace 'characteristics/:id' do
      before do
        @characteristic = try_find(Characteristic, :id)
      end

      desc 'Получить характеристику по идентификатору'
      get '/', jbuilder: 'v1/characteristics/show'

      desc 'Обновить характеристику'
      params do
        optional :title, type: String, desc: 'Название'
        optional :description, type: String, desc: 'Описание'
        optional :attrs, type: Hash, desc: 'Атрибуты'
      end
      put '/', jbuilder: 'v1/characteristics/show' do
        update!(@characterisic, :title, :description, :attrs)
      end

      desc 'Удалить характеристику'
      delete '/' do
        destroy!(@characteristic)
      end
    end
  end
end
