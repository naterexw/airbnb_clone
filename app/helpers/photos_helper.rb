module PhotosHelper
  def image_url(photo)
    photo.try(:image).try(:url) || 'image-coming-soon.png'
  end
end
