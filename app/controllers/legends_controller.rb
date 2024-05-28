def show
end

private

def set_params
  @legend = Legend.find(params[:id])
end
