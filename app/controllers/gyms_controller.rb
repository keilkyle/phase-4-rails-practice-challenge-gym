class GymsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :not_founder 

    def show
        gym = Gym.find_by!(id: params[:id])
        render json: gym
    end

    def destroy
        gym = Gym.find_by!(id: params[:id])
        gym.destroy
        head :no_content, status: :ok
    end

    private

    def not_founder
        render json: {error: "Gym not found"}, status: :not_found
    end
end
