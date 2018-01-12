require File.join(Rails.root, "app/services/images/image_writer_service")

namespace :images do

  desc 'Import images from remote server'
  task import: :environment do
    p 'Initializing the import images'
    image_writer = ImageWriterService.new
    p 'Importing images...'
    image_writer.fill_images
    p 'Finish'
  end

end
