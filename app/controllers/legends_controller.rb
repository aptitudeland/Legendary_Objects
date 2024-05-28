class LegendsController < ApplicationController

  def index
    @legends = Legend.all
  end

end
