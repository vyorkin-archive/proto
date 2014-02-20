require 'spec_helper'

describe V1::EntityTypes, :api do
  let(:params) do
    {
      :name        => 'name',
      :description => 'description',
      :attrs       => hash
    }
  end

  describe 'GET /api/v1/entity_types' do
    before do
      create_list(:entity_type, 1)
      get 'api/v1/entity_types'
    end

    it { should be_success }
  end

  describe 'POST /api/v1/entity_types' do
    before { post '/api/v1/entity_types', params }
    it     { should be_success }
  end

  describe 'PUT /api/v1/entity_types/:id' do
    let!(:entity_type) { create :entity_type }

    before { put "/api/v1/entity_types/#{entity_type.id}", params }
    it     { should be_success }
  end

  describe 'DELETE /api/v1/entity_types/:id' do
    let!(:entity_type) { create :entity_type }

    before { delete "/api/v1/entity_types/#{entity_type.id}" }
    it     { should be_success }
  end
end
