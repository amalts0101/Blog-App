# Post.rb file
class Post < ApplicationRecord
  attr_accessor :image_width, :image_height
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  mount_uploader :image, AvatarUploader

  validate :check_dimensions, on: :create

  def check_dimensions
    if !image_cache.nil? && (image.width < 1280 || image.height < 720)
      errors.add :image, 'Dimension should be atleast 1280x720.'
    end
  end
end
