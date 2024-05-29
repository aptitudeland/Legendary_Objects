class LegendsController < ApplicationController
  before_action :set_legend, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @legends = Legend.all
  end

  def show
  end

  def new
    @legend = Legend.new
  end

  def create
    @legend = Legend.new(params[:legend])
    @legend.save
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
    params.require(:legend).permit(:name, :description, :category, :price)
  end
end
