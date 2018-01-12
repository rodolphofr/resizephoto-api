require 'rails_helper'
require File.join(Rails.root, "app/services/images/image_writer_service")

RSpec.describe Api::V1::ImageController, type: :controller do
  before(:all) { ImageWriterService.new.populate }

  describe '#index' do
    it 'list 10 url images' do
      get :index
      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(json["images"].length).to eq(10)
    end
  end

  describe '#show' do
    let(:first_image) { Image.first }

    it 'get image by id' do
      response = get(:show, params: { id: first_image._id.to_s })
      expect(response).not_to be_nil

      json = JSON.parse(response.body)
      expect(json).to have_key('image')
      expect(json['image']).not_to be_empty
    end
  end

end
