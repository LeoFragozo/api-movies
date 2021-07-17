require 'rails_helper'

RSpec.describe "Api::V1::Countries", type: :request do

  describe "GET /index" do    
    it 'must return 200 http status' do
        country = create(:country)
        get '/api/v1/countries'
        expect(response).to have_http_status(:ok)
      end
    
      it 'must return the current country data' do
        create(:country, name: 'Brasil')
        create(:country, name: 'Japan')
        create(:country, name: 'EUA')
        get '/api/v1/countries'  
        expect(json_body[:data][0]).to have_key(:id)
        expect(json_body[:data][0]).to have_key(:name)
        expect(json_body[:data][0]).to have_key(:created_at)
        expect(json_body[:data][0]).to have_key(:updated_at)
        
        expect(json_body[:data][0][:name]).to eq('Brasil' )
        expect(json_body[:data][1][:name]).to eq('Japan' )
        expect(json_body[:data][2][:name]).to eq('EUA' )

      end
 
      describe 'GET #show' do
        it 'must return 200 http status' do
          country = create(:country)
          get "/api/v1/countries/#{country.id}"
          expect(response).to have_http_status(:ok)
          end

          it 'must return Japan data' do
            country = create(:country, name: 'Japan')
            get "/api/v1/countries/#{country.id}"
            expect(json_body[:data][:name]).to eq('Japan' )
          end
      end
    end
  end