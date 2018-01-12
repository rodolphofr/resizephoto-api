class ImageDownloader

  DEFAULT_DOWNLOAD_PATH = Rails.root.join('public', 'images').freeze

  def download(image, filename, dest = DEFAULT_DOWNLOAD_PATH)
    name = File.basename(filename, '.*')
    path = create_dir_path(image, name, dest)
    abs_path = File.join(path, filename)

    if not File.exists?(path)
      FileUtils.mkpath(path)
    end

    image.write(abs_path)

    abs_path
  end

  private

  def create_dir_path(image, filename, dest)
    File.join(dest, filename, "#{image.width}x#{image.height}")
  end
end