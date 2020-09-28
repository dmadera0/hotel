class GuestsController < ApplicationController
    
    def index
        @guests = Guest.all

        render json: @guests
    end

    def show
        @guest = Guest.find(params[:id])

        render json: @guest, include: [:room, :reservation]
    end

    def create
        @guest = Guest.create(
            username: params[:username],
            party_size: params[:party_size],
            password: params[:password]

        )
            render json: @guest
    end

    def update
        @guest = Guest.find(params[:id])
        @guest.update(
            name: params[:name],
            party_size: params[:party_size],
            password: params[:password]
        )
        render json: @guest
    end

    def destroy
        @guest = Guest.find(params[:id])
        @guest.destroy

        render json: @guest
    end


end
