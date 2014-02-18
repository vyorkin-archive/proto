module V1
  class SkillsInteractions < Grape::API
    helpers APICommonHelpers

    params do
      requires :skills_id, type: Integer, desc: 'Идентификатор умения'
    end
    namespace 'skills/:skill_id/interactions' do
      before do
        @skill = try_find(Skill, :id, :skill_id)
      end

      desc 'Получить все доступные взаимодействия для умения'
      get '/', jbuilder: 'v1/skill_interactions/index' do
        @skill.interactions
      end
    end
  end
end
