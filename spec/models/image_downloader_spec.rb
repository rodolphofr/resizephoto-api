require File.join(Rails.root, "lib/images/image_downloader")
require 'rails_helper'

RSpec.describe ImageDownloader, type: :model do
  let(:downloader) { ImageDownloader.new }
  let(:image_url) { 'http://54.152.221.29/images/b737_3.jpg' }
  let(:image) { ImageResizer.new.resize(image_url, :small) }
  let(:filename) { File.basename(image_url) }
  let(:other_dest) { Rails.root.join('spec', 'test_assets') }

  describe '.download' do
    it 'should download image' do
      path = downloader.download(image, filename, other_dest)
      expect(File.exists?(path)).to be true
    end
  end
end