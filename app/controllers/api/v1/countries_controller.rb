# frozen_string_literal: true

module Api
 module V1
  class CountriesController < ApplicationController

    def index
      countries = Country.order('created_at ASC')
      render json: { status: 'SUCCESS', message: 'Países carregados', data: countries },
           status: :ok
    end

    def show
      country = Country.find(params[:id])
      render json: { status: 'SUCCESS', message: 'Países carregados', data: country },
             status: :ok
    end

    private

    def country_params
      params.require(:country).permit(:id, :name)
    end

  end
 end 
end