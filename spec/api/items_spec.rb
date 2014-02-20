require 'spec_helper'

describe V1::Items, :api do
  let!(:item_type) { create :item_type }
  let (:params) { { :attrs => hash } }

  describe 'GET /api/v1/items' do
    before do
      create_list(:item, 1)
      get '/api/v1/items'
    end

    it { should be_success }
  end

  describe 'GET /api/v1/items/:id' do
    let!(:item) { create :item }
    before { get "/api/v1/items/#{item.id}" }
    it     { should be_success }
  end

  describe 'PUT /api/v1/items/:id' do
    let!(:item) { create :item }

    before { put "/api/v1/items/#{item.id}", params }
    it     { should be_success }
  end

  describe 'DELETE /api/v1/items/:id' do
    let!(:item) { create :item }

    before { delete "/api/v1/items/#{item.id}" }
    it     { should be_success }
  end

  describe 'GET /api/v1/item_types/:item_type_id/items' do
    before do
      create_list(:item, 1, :type => item_type)
      get "/api/v1/item_types/#{item_type.id}/items"
    end

    it { should be_success }
  end

  describe 'POST /api/v1/item_types/:item_type_id/items' do
    before { post "/api/v1/item_types/#{item_type.id}/items", params }
    it     { should be_success }
  end
end
