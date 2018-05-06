class ReservationInformationsController < ApplicationController
  def create
  end

  def index

  end
  def show
    @reservation = ReservationInformation.uno(params[:id]);
  end

  def update
  end

  def destroy
  end
end
