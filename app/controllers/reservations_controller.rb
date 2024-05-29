class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @reservation = Reservation.new()
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to @reservation, notice: 'Reservation was successfully created.'
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:starting_date, :ending_date, :legend_id)
  end
end
