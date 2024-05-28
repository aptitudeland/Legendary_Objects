class LegendsController < ApplicationController
  before_action :set_legend, only: [:show]

  def index
    @legends = Legend.all
  end

  def show
  end

  private

  def set_legend
    @legend = Legend.find(params[:id])
  end
end
