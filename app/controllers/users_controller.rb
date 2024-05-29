class UsersController < ApplicationController

  def show
    # et un user
    @user = User.find(params[:id])
    # la méthode show doit passer un array de réservation
    @reservations = @user.reservations # ça donne toutes les réservations EMISES par @user
    
    # un array de legendes à la vue
  end


end
