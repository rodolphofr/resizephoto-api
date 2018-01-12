class ImageResizer

  DIMENSIONS = {
    small:  '320x240',
    medium: '384x288',
    large:  '640x480'
  }.freeze

  def resize(image_url, dimension)
    image = MiniMagick::Image.open(image_url)
    size  = get_dimensions_size(dimension)
    image.resize size
    image
  end

  def get_dimensions_size(dimension)
    DIMENSIONS.fetch(dimension)
  end
end