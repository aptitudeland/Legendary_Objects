class UsersController < ApplicationController
  before_action :set_params
  before_action :access_dashboard

  def show
    # et un user
    set_params
    # la méthode show doit passer un array de réservation
    @reservations = @user.reservations # ça donne toutes les réservations EMISES par @user
    # un array de legendes à la vue
    @legends = @user.legends
  end

  def access_dashboard
    set_params
    if @user == current_user
      # Passe la show automatiquement
    else
      redirect_to legends_path
    end
  end

  def set_params
    @user = User.find(params[:id])
  end
end
