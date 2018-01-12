require 'rails_helper'

RSpec.describe Api::V1::ImageController, type: :controller do

  describe "#index" do
    it 'list 10 url images' do
      get :index
      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json["images"].length).to eq(10)
    end
  end

  describe "#show" do
    it 'get image by id' do
      create(:basic_image)
      get :show, params: { id: basic_image._id }

      response = JSON.parse(response.body)

      expect(response).to be_success
      expect(response['image'].length).to eq(1)
    end
  end

end
