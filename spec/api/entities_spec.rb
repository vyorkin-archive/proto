require 'spec_helper'

describe V1::Entities, :api do
  let!(:entity_type) { create :entity_type }
  let (:params) { { :attrs => hash } }

  describe 'GET /api/v1/entities' do
    before do
      create_list(:entity, 1)
      get '/api/v1/entities'
    end

    it { should be_success }
  end

  describe 'GET /api/v1/entities/:id' do
    let!(:entity) { create :entity }
    before { get "/api/v1/entities/#{entity.id}" }
    it     { should be_success }
  end

  describe 'PUT /api/v1/entities/:id' do
    let!(:entity) { create :entity }

    before { put "/api/v1/entities/#{entity.id}", params }
    it     { should be_success }
  end

  describe 'DELETE /api/v1/entities/:id' do
    let!(:entity) { create :entity }

    before { delete "/api/v1/entities/#{entity.id}" }
    it     { should be_success }
  end

  describe 'GET /api/v1/entity_types/:entity_type_id/entities' do
    before do
      create_list(:entity, 1, :type => entity_type)
      get "/api/v1/entity_types/#{entity_type.id}/entities"
    end

    it { should be_success }
  end

  describe 'POST /api/v1/entity_types/:entity_type_id/entities' do
    before { post "/api/v1/entity_types/#{entity_type.id}/entities", params }
    it     { should be_success }
  end
end
