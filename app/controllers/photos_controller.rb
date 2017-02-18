class PhotosController < ApplicationController
  def destroy
    @photo = Photo.find(params[:id])
    room = @photo.room

    @photo.destroy

    # Instance variable for remaining photos for destoy.js.slim j render
    @photos = Photo.where(room_id: room.id)

    respond_to :js
  end
end
