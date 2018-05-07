class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    if(params[:id]) && validate_uuid_format(params[:id])
      if @reservation = Reservation.uno(params[:id])
        redirect_to @reservation
      else
        flash[:error] = "Reservation not found"
      end
    else
      # flash[:error] = "Invalid reservation number"
    end
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
      flash[:notice] = 'Reservation succesfully created.'
      redirect_to edit_reservation_path(@reservation)
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

    def validate_uuid_format(uuid)
      uuid_regex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
      return true if uuid_regex.match?(uuid.to_s.downcase)
      false
    end

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
