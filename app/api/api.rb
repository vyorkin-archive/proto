class API < Grape::API
  format :json
  default_format :json
  content_type :json, 'application/json; charset=utf-8'
  formatter :json, Grape::Formatter::Jbuilder
  rescue_from :all, :backtrace => true

  desc 'Game proto API'

  mount V1::EntityTypes

  add_swagger_documentation :hide_documentation_path => true,
    :base_path => ->(request) { "#{request.base_url}/api/v1" }
end
