class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new()
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    # @reservation.status = "Pending"
    if @reservation.save
      redirect_to @reservation.legend, notice: 'La réservation a bien été prise en compte.'
    elsif user_signed_in?
      # si l utilisateur est connecte + NOTICE reservation failed
      # RESTER vers legend show
      render 'legends/show', notice: 'La réservation a échouée.'
    else
      # sinon redirection vers page de connection
      redirect_to new_user_session_path, notice: "Merci de vous connecté avant d'éffectuer une réservation."
    end
  end

  def update_status
    @reservation = Reservation.find(params[:id])
    if @reservation.update(status: params[:reservation][:status])
      flash[:notice] = "Le statut de la réservation a bien été mis à jour à : #{params[:reservation][:status]} ."
    else
      flash[:alert] = 'Une erreur est survenue lors de la mise à jour du statut.'
    end
    redirect_back(fallback_location: @reservation.legend)
  end

  def destroy
    # NE FONCTIONNE PAS
    puts "start destroying"
    @reservation = Reservation.find(params[:id])
    puts @reservation
    if @reservation.destroy
      flash[:notice] = "La réservation a été supprimée avec succès."
    else
      flash[:alert] = "Une erreur est survenue lors de la suppression de la réservation."
    end
    redirect_to reservations_path # Redirection vers l'index des réservations
  end


  private

  def reservation_params
    params.require(:reservation).permit(:starting_date, :ending_date, :legend_id, :status)
  end
end
