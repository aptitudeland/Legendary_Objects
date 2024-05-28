class LegendsController < ApplicationController

  def index
    @legend = legend.all
  end

end
