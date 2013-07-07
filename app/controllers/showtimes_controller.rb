class ShowtimesController < ApplicationController
    def show
      @showtime = Showtime.find(params[:id])
    end

    def purchase
      showtime = Showtime.find(params[:showtime_id])
      showtime.purchase_seat(params[:row].to_i, params[:seat_number].to_i, current_user)
      head :ok
    rescue Showtime::SeatNotFound
      head :not_found
    rescue Showtime::SeatAlreadyPurchased
      head :conflict
    end
end
