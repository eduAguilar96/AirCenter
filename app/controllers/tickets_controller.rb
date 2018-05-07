class TicketsController < ApplicationController
  def create
    @reservation = Reservation.find_by(id: params[:reservation_id])
    if @tickets = Ticket.create(create_params)
      redirect_to @reservation
    else
      redirect_to @reservation
    end
  end

  def index
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def create_params
    params[:tickets].each do |ticket|
      ticket[:cost] = params[:cost]
    end
    params.permit(tickets:
      [
        :reservation_id,
        :user_id,
        :seat,
        :zone,
        :cost
      ]
    )[:tickets]
  end
end
