class ReservationsController < ApplicationController

    def index
        @reservations = Reservation.all

        render json: @reservations, include: [:guest, :room]
    end

    def show
        @reservation = Reservation.find(params[:id])

        render json: @reservation, include: [:room, :guest]
    end

    def create
        @reservation = Reservation.create(
            checkin_date: params[:checkin_date],
            checkout_date: params[:checkout_date],
            room_id: params[:room_id],
            guest_id: params[:guest_id]

        )
            render json: @reservation, include:[:guest, :room]
    end

    def update
        @reservation = Reservation.find(params[:id])
        @reservation.update(
            checkin_date: params[:checkin_date],
            checkout_date: params[:checkout_date],
            room_id: params[:room_id],
            guest_id: params[:guest_id]
        )
        render json: @reservation, include: [:guest, :room]
    end

    def destroy
        @reservation = find(params[:id])
        @reservation.destroy

        render json: @reservation
    end

end
