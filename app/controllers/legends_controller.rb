class LegendsController < ApplicationController
  before_action :set_legend, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @legends = Legend.all
  end

  def show
    @legend = Legend.find(params[:id])
    @reservation = Reservation.new
  end

  private

  def set_legend
    @legend = Legend.find(params[:id])
  end
end
