require 'spec_helper'

describe V1::Interactions, :api do
  let(:params) do
    {
      :title       => 'title',
      :description => 'description'
    }
  end

  describe 'GET /api/v1/interactions' do
    before do
      create_list(:interaction, 1)
      get 'api/v1/interactions'
    end

    it { should be_success }
  end

  describe 'POST /api/v1/interactions' do
    before { post '/api/v1/interactions', params }
    it     { should be_success }
  end

  describe 'PUT /api/v1/interactions/:id' do
    let!(:interaction) { create :interaction }

    before { put "/api/v1/interactions/#{interaction.id}", params }
    it     { should be_success }
  end

  describe 'DELETE /api/v1/interactions/:id' do
    let!(:interaction) { create :interaction }

    before { delete "/api/v1/interactions/#{interaction.id}" }
    it     { should be_success }
  end
end
