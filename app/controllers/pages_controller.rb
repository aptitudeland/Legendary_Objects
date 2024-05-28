class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end
end

def show
end

private

def set_params
  @legend = Legend.find(params[:id])
end
