class BookingsController < ApplicationController
  before_action :set_room
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

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def booking_params
    params.require(:booking).permit(:room_id, :start_date, :end_date, :price, :total_price)
  end
end
