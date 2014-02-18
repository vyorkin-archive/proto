module V1
  class Users < Grape::API
    helpers APICommonHelpers

    namespace 'users' do
      desc 'Получить всех пользователей'
      get '/', jbuilder: 'v1/users/index' do
        @users = User.all
      end
    end

    params do
      requires :id, type: Integer, desc: 'Идентификатор'
    end
    namespace 'users/:id' do
      before do
        @user = try_find(User, :id)
      end

      desc 'Получить пользователя по идентификатору'
      get '/', jbuilder: 'v1/users/show'

      desc 'Обновить пользователя'
      params do
        optional :email, type: String, desc: 'Email'
        optional :nick, type: String, desc: 'Никнейм'
      end
      put '/', jbuilder: 'v1/users/show' do
        update!(@user, :email, :nick)
      end

      desc 'Удалить пользователя'
      delete '/' do
        destroy!(@user)
      end
    end
  end
end
