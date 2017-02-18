class Photo < ApplicationRecord
  belongs_to :room

  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/]
  validates_attachment_presence :image
  validates_attachment_size :image, less_than: 0.75.megabytes
end
