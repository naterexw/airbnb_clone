class BookingsController < ApplicationController
  before_action :set_room
  before_action :sanitize_booking_params
  before_action :authenticate_user!

  def create
    @booking = current_user.bookings.build(booking_params)

    if current_user.id == @room.user.id
      redirect_to @booking.room, flash: { alert: "You can't make a booking for your own room" }
      return
    end

    if @booking.save
      redirect_to @booking.room, flash: { success: 'Created booking' }
    else
      flash[:alert] = @booking.errors.full_messages.first
      redirect_to @booking.room
    end
  end

  def preload
    room = Room.find(params[:id])
    today = Date.today
    bookings = room.bookings.where('start_date >= ? OR end_date >= ?', today, today)

    render json: bookings
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def booking_params
    params.require(:booking).permit(:room_id, :start_date, :end_date, :price, :total_price)
  end

  def sanitize_booking_params
    params[:booking][:start_date] = Date.parse(params[:booking][:start_date])
    params[:booking][:end_date] = Date.parse(params[:booking][:end_date])
  end
end
