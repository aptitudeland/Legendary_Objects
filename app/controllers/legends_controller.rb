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

  def new
    @legend = Legend.new
  end

  def create
    @legend = Legend.new(legend_params)
    @legend.user = current_user
    if @legend.save
      redirect_to @legend, notice: 'Legend was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end





  def destroy
    @legend = Legend.find(params[:id])
    @legend.destroy
    redirect_to legends_path, status: :see_other
  end

  private

  def set_legend
    @legend = Legend.find(params[:id])
  end

  def legend_params
    params.require(:legend).permit(:name, :description, :category, :price, photos: [])
  end
end
