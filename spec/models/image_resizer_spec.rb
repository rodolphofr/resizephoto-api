require File.join(Rails.root, "lib/images/image_resizer")
require 'rails_helper'

RSpec.describe ImageResizer, type: :model do
  let(:resizer) { ImageResizer.new }

  describe '.get_dimensions_size' do
    it 'should return small dimension' do
      expect(resizer.get_dimensions_size(:small)).to eq('320x240')
    end

    it 'should return medium dimension' do
      expect(resizer.get_dimensions_size(:medium)).to eq('384x288')
    end

    it 'should return large dimension' do
      expect(resizer.get_dimensions_size(:large)).to eq('640x480')
    end
  end

  describe '.resize' do
    let(:image_url) { 'http://54.152.221.29/images/b737_3.jpg' }

    context 'when i pass a valid dimension and valid image url' do
      it 'then image dimension is small' do
        image = resizer.resize(image_url, :small)
        expect(image.width).to eq(320)
        expect(image.height).to eq(240)
      end

      it 'then image dimension is medium' do
        image = resizer.resize(image_url, :medium)
        expect(image.width).to eq(384)
        expect(image.height).to eq(288)
      end

      it 'then image dimension is large' do
        image = resizer.resize(image_url, :large)
        expect(image.width).to eq(640)
        expect(image.height).to eq(480)
      end
    end
  end

end