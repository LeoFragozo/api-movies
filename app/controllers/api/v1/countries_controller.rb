# frozen_string_literal: true

module Api
 module V1
  class CountriesController < ApplicationController

      def index
        countries = Country.order('created_at ASC')
        render json: { status:'SUCCESS', message:'Países carregados', data: countries },
        status: :ok
      end

      def show
        country = Country.find(params[:id])
        if country.status == true
          render json: {body:country, message:'País encontrado'}, 
          status: :ok
        else
          render json: {body:country, message:'País inativo'},
          status: :not_found
        end
      end

      def destroy
        country = Country.find(params[:id])
        if country.status == true
          render json: {body:country, message:'Não é possível excluir um país ativo'}, 
          status: :unprocessable_entity
        else
        country.destroy
          render json: { body:country, message: 'País inativo deletado' }, 
          status: :no_content
      end
    end

    private
      def country_params
        params.require(:country).permit(:id, :name)
      end
    end
  end
end
