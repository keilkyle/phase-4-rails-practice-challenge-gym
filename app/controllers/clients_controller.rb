class ClientsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :not_founder

    def show
        client = Client.find_by!(id: params[:id])
        render json: client
    end

    private

    def not_founder
        render json: {error: "Client not found"}, status: :not_found
    end

end
