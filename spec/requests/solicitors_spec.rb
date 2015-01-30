require 'rails_helper'

RSpec.describe "Solicitors API", type: :request do
  describe 'searching' do
    it 'returns results with no search string' do
      Solicitor.create

      post '/solicitors/search'

      expect(response).to be_success
      expect(json['solicitors'].length).to eq(1)
    end

    it 'returns solicitors that match the search term' do
      Solicitor.create name: 'Bob'
      solicitor = Solicitor.create name: 'Alan'

      post '/solicitors/search', { q: 'alan' }

      expect(response).to be_success
      expect(json['solicitors'].length).to eq(1)

      json_response = json['solicitors'].first

      ['id', 'name', 'address', 'postcode', 'mobile', 'email'].each do |field|
        expect(json_response[field]).to eq(solicitor.send(field))
      end
    end

    it 'returns a maxiumum of 10 results' do
      11.times do 
        Solicitor.create
      end

      post '/solicitors/search'

      expect(response).to be_success
      expect(json['solicitors'].length).to eq(10)
    end
  end
end