class API < Grape::API
  format :json
  default_format :json
  content_type :json, 'application/json; charset=utf-8'
  formatter :json, Grape::Formatter::Jbuilder
  rescue_from :all, :backtrace => true

  desc 'Game proto API'

  mount V1::Users
  mount V1::Players
  mount V1::EntityTypes
  mount V1::Entities
  mount V1::Characteristics
  mount V1::Interactions
  mount V1::ItemTypes
  mount V1::Items
  mount V1::Skills
  mount V1::PlayerSkills

  add_swagger_documentation :hide_documentation_path => true,
    :base_path => ->(request) { "#{request.base_url}/api/v1" }
end
