# frozen_string_literal: true

module Api
 module V1
  class CountriesController < ApplicationController

    def index
    countries = Country.order('created_at ASC')
    render json: { status: 'SUCCESS', message: 'Países carregados', data: countries },
           status: :ok
    end

  end
 end 
end