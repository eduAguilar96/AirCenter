class FlightsController < ApplicationController

  def create
  end

  def index
    if params.try(:[], :flight) &&
      params[:flight][:origin] != "" &&
      params[:flight][:destination] != "" &&
      params[:flight][:from] != "" &&
      params[:flight][:to] != ""
        @flights = Flight.algunos(
          params[:flight][:origin],
          params[:flight][:destination],
          params[:flight][:from],
          params[:flight][:to]
        )
    else
      @flights = Flight.todos
    end
  end

  def show
    @flight = Flight.uno(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def flight_params
    params.require(:flight).permit(:destination)
  end
end
