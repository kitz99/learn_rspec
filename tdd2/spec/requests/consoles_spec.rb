require 'rails_helper'

RSpec.describe 'Consoles requests' do

  describe 'GET /consoles' do
    it 'returns an array of consoles' do
      get '/consoles'
      expect(response_json['consoles']).to contain_exactly(
        'NES',
        'SNES',
        'Wii',
        'Genesis',
        'Xbox',
        'Switch',
        'PS1',
        'PS2'
      )
    end

    it 'suports specifying consoles for a specific manufacturer' do
      get "/consoles", params: { manufacturer: 'Nintendo' }
      expect(response_json['consoles']).to contain_exactly(
        'NES',
        'SNES',
        'Wii',
        'Switch'
      )

      get "/consoles", params: { manufacturer: 'Sega' }
      response_json = JSON.parse(response.body)
      expect(response_json['consoles']).to contain_exactly('Genesis')
    end
  end
end
