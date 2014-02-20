require 'spec_helper'

describe V1::ItemTypes, :api do
  let(:params) do
    {
      :name        => 'name',
      :description => 'description',
      :attrs       => hash
    }
  end

  describe 'GET /api/v1/item_types' do
    before do
      create_list(:item_type, 1)
      get 'api/v1/item_types'
    end

    it { should be_success }
  end

  describe 'POST /api/v1/item_types' do
    before { post '/api/v1/item_types', params }
    it     { should be_success }
  end

  describe 'PUT /api/v1/item_types/:id' do
    let!(:item_type) { create :item_type }

    before { put "/api/v1/item_types/#{item_type.id}", params }
    it     { should be_success }
  end

  describe 'DELETE /api/v1/item_types/:id' do
    let!(:item_type) { create :item_type }

    before { delete "/api/v1/item_types/#{item_type.id}" }
    it     { should be_success }
  end
end
