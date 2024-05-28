class LegendsController < ApplicationController
  before_action :set_legend, only: [:show]

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

  private

  def set_legend
    @legend = Legend.find(params[:id])
  end

  def legend_params
    params.require(:legend).permit(:name, :description, :category, :price)
  end
end
