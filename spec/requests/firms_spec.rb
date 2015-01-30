require 'rails_helper'

RSpec.describe "Firms API", type: :request do
  describe 'searching' do
    it 'returns results with no search string' do
      Firm.create

      post '/firms/search'

      expect(response).to be_success
      expect(json['firms'].length).to eq(1)
    end

    it 'returns firms that match the search term' do
      Firm.create name: 'Clearwater'
      firm = Firm.create name: 'Roberts and Horse'

      post '/firms/search', { q: 'roberts' }

      expect(response).to be_success
      expect(json['firms'].length).to eq(1)
      
      json_response = json['firms'].first

      ['id', 'name', 'address', 'postcode', 'tel', 'email'].each do |field|
        expect(json_response[field]).to eq(firm.send(field))
      end
    end

    it 'returns a maxiumum of 10 results' do
      11.times do 
        Firm.create
      end

      post '/firms/search'

      expect(response).to be_success
      expect(json['firms'].length).to eq(10)
    end
  end
end