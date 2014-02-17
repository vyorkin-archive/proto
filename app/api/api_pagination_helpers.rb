module APIPaginationHelpers
  extend Grape::API::Helpers

  params :pagination do
    optional :page, type: Integer, desc: 'Страница', default: 1
    optional :page_size, type: Integer, desc: 'Сколько элементов на странице', default: Kaminari.config.default_per_page
  end
end
