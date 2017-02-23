class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @rooms = current_user.rooms.all
  end

  def show
    @photos = @room.photos
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      if params[:images]
        params[:images].each do |image|
          @room.photos.create(image: image)
        end
      end
      @photos = @room.photos
      redirect_to room_path(@room), flash: { success: 'Created room' }
    else
      flash[:alert] = @room.errors.full_messages.first
      render :new
    end
  end

  def edit
    if current_user.id == @room.user.id
      @photos = @room.photos
    else
      redirect_to root_path, flash: { alert: "You don't have permission" }
    end
  end

  def update
    if @room.update(room_params)
      if params[:images]
        params[:images].each do |image|
          @room.photos.create(image: image)
        end
      end
      redirect_to edit_room_path(@room), flash: { success: 'Updated room' }
    else
      flash[:alert] = @room.errors.full_messages.first
      render :edit
    end
  end

  def destroy; end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:home_type,
                                 :room_type,
                                 :accomodate,
                                 :bedroom,
                                 :bathroom,
                                 :listing_name,
                                 :summary,
                                 :address,
                                 :is_tv,
                                 :is_kitchen,
                                 :is_air,
                                 :is_heating,
                                 :is_internet,
                                 :price,
                                 :active)
  end
end
