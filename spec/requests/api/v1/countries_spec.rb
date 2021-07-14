require 'rails_helper'

RSpec.describe "Api::V1::Countries", type: :request do
  describe "GET /index" do
      it 'must return 200 http status' do
        country = create(:country)
        get '/api/v1/countries'
        expect(response).to have_http_status(:ok)
      end
       
      it 'must return the current country data' do
        country = create(:country)
        get '/api/v1/countries'  
        expect(json_body[:data][0]).to have_key(:id)
        expect(json_body[:data][0]).to have_key(:name)
      end
      
    end
  end