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
      
      describe "GET #show" do
      
      it "returns a 200 custom status code" do
        country = create(:country, status: true)
        get "/api/v1/countries/#{country.id}"
        expect(response).to have_http_status(200)
        end

      it "returns a 404 custom status code" do
        country = create(:country, status: false)
        get "/api/v1/countries/#{country.id}"
        expect(response).to have_http_status(404) 
      end
      
      it 'must return Japan data' do
        country = create(:country, name: 'Japan', status:  'true' )
        get "/api/v1/countries/#{country.id}"
        expect(json_body[:body][:name]).to eq('Japan')
      end

      it 'must return nil data' do
        country = create(:country, name: nil, status: 'false' )
        get "/api/v1/countries/#{country.id}"
        expect(json_body[:message]).to eq ('País inativo') 
      end
    end

    describe "delete operations" do
  
     it "avoid delete of active countries" do
        country = create(:country, status: 'true' )
        delete "/api/v1/countries/#{country.id}"
        expect(json_body[:message]).to eq ('Não é possível excluir um país ativo')
        expect(response.status).to eq(422)
        expect(json_body[:body][:name]).to eq('Brasil')        
      end

      it "allow delete of inactive countries" do
        country = create(:country, status: 'false' )
        delete "/api/v1/countries/#{country.id}"
        expect(response.status).to eq(204)          
     end
    end

     describe "update operation" do
  
      it "successfully updates a country" do
         country = create(:country, status: 'true' )
         body_data = { country: { name: 'Reino Unido'} }
         put "/api/v1/countries/#{country.id}", params: body_data
         expect(json_body[:message]).to eq ('País atualizado')
         expect(response.status).to eq(200)        
       end

       it "error in updating a country" do
        country = create(:country, status: 'false' )
        body_data = { country: { name: ''} }
        put "/api/v1/countries/#{country.id}", params: body_data
        expect(json_body[:message]).to eq ('Erro ao atualizar país')
        expect(response.status).to eq(422) 

      end
   end

  end
end