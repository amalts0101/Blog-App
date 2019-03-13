# frozen_string_literal: true

# class avatar
class AvatarUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url(*_args)
    # For Rails 3.1+ asset pipeline compatibility
    '/assets/default-image.jpg'
  end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  attr_reader :width, :height
  before :cache, :capture_size
  def capture_size(file)
    return if version_name.present?

    if file.path.nil?
      img = MiniMagick.Image.read(file.file)
      @width = img[:width]
      @height = img[:height]
    else
      a = `identify -format "%wx %h" #{file.path}`
      @width, @height = a.split(/x/).map(&:to_i)
    end
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here,
  # see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
