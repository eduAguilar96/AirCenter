class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = Reservation.all
  end

  def show
    @flight = Flight.uno_mejor(@reservation.flight_id)
    @users = User.algunos(@reservation.id) || []
    @tickets = Ticket.algunos(@reservation.id)
  end

  def new
    @reservation = Reservation.new
    @reservation.users.build
  end

  def edit
    @reservation.users.build
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to edit_reservation_path(@reservation), notice: 'Reservation succesfully created.'
    else
      render :new, notice: 'hay un pedo'
    end
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to edit_reservation_path(@reservation), notice: "Reservation succesfully updated"
    else
      render :edit, notice: 'hay un pedo'
    end
  end

  def destroy
  end

  private
    def set_reservation
      @reservation = Reservation.uno(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(
        :flight_id,
        users_attributes: User.attribute_names.map(&:to_sym)
      )
    end
end
