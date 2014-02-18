require 'spec_helper'

describe V1::Characteristics, :api do
  let(:params) do
    {
      :title       => 'title',
      :description => 'description',
      :attrs       => hash
    }
  end

  describe 'GET /api/v1/characteristics' do
    before do
      create_list(:characteristic, 1)
      get 'api/v1/characteristics'
    end

    it { should be_success }
  end

  describe 'POST /api/v1/characteristics' do
    before { post '/api/v1/characteristics', params }
    it     { should be_success }
  end

  describe 'PUT /api/v1/characteristics/:id' do
    let!(:characteristic) { create :characteristic }

    before { put "/api/v1/characteristics/#{characteristic.id}", params }
    it     { should be_success }
  end

  describe 'DELETE /api/v1/characteristics/:id' do
    let!(:characteristic) { create :characteristic }

    before { delete "/api/v1/characteristics/#{characteristic.id}" }
    it     { should be_success }
  end
end
