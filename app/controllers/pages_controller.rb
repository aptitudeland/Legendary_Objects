class PagesController < ApplicationController
  def home
  end
end

def show
end

private

def set_params
  @legend = Legend.find(params[:id])
end
