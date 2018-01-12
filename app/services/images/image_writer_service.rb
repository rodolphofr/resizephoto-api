require File.join(Rails.root, "lib/images/image_resizer")
require File.join(Rails.root, "lib/images/image_downloader")
require_relative 'b2w_images_request'

class ImageWriterService
  def populate
    responses  = B2WImagesRequest.get
    resizer    = ImageResizer.new
    downloader = ImageDownloader.new

    responses.each do |response|
      image_url = response.url
      formats = []

      ImageResizer::DIMENSIONS.each_key do |dimension|
        image = resizer.resize(image_url, dimension)
        path  = downloader.download(image, File.basename(image_url))
        formats << { dimension => path }
      end

      image = Image.new({ url: image_url, formats: formats })
      image.save!
    end
  end
end