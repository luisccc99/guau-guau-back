class Api::V1::LocalizationsController < ApplicationController
#Get the id before request for find.
before_action :authorization, :get_localization_id, only: [:show, :delete]
    def index
        localization = Localization.all
        if !localization.empty?
            render json: localization, status: :ok
        else
            render json: {message: "No locations."}, status: :no_content
        end
    end

    #GET
    #singularGet
    def show
        if @found
            render json: @found, status: :ok
        else
            render json: {message: "Not found."}, status: :no_content
        end
    end

    #DELETE
    def destroy
        if @found
            if @found.destroy(localization_params)
                render json: @found, status: :ok
            else
                render json: {message: "Failed to delete."}, status: :unprocessable_entity
            end
        else
            render json: {message: "Location not found"}, status: :no_content
        end
    end

    private
        def localization_params 
            params.permit(:X, :Y, :post_id)
        end
        def get_localization_id
            @found = Localization.find(params[:id])
        end
end