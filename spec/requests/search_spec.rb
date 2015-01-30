require 'rails_helper'

RSpec.describe "Search API", type: :request do
  it 'returns results with no search string' do
    Solicitor.create
    Firm.create

    post '/search'

    expect(response).to be_success
    expect(json['solicitors'].length).to eq(1)
    expect(json['firms'].length).to eq(1)
  end

  it 'returns solicitors that match the search term' do
    Solicitor.create name: 'Bob'
    solicitor = Solicitor.create name: 'Alan'

    post '/search', { q: 'alan' }

    expect(response).to be_success
    expect(json['solicitors'].length).to eq(1)

    json_response = json['solicitors'].first

    ['id', 'name', 'address', 'postcode', 'mobile', 'email'].each do |field|
      expect(json_response[field]).to eq(solicitor.send(field))
    end
  end

  it 'returns firms that match the search term' do
    Firm.create name: 'Clearwater'
    firm = Firm.create name: 'Roberts and Horse'

    post '/search', { q: 'roberts' }

    expect(response).to be_success
    expect(json['firms'].length).to eq(1)
    
    json_response = json['firms'].first

    ['id', 'name', 'address', 'postcode', 'tel', 'email'].each do |field|
      expect(json_response[field]).to eq(firm.send(field))
    end
  end

  it 'returns all solicitors for each firm' do
      firm = Firm.create
      solicitor = Solicitor.create firm: firm

      post '/search'

      json_response = json['firms'].first
      expect(json_response['solicitors']).to be_a(Array)
      expect(json_response['solicitors'].first['id']).to eq(solicitor.id)
    end

  it 'returns a maxiumum of 10 results' do
    11.times do 
      Solicitor.create
      Firm.create
    end

    post '/search'

    expect(response).to be_success
    expect(json['solicitors'].length).to eq(10)
    expect(json['firms'].length).to eq(10)
  end
end