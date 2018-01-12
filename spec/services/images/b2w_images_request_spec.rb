require File.join(Rails.root, "app/services/images/b2w_images_request")
require 'rails_helper'

RSpec.describe B2WImagesRequest, type: :service do

  describe '.get' do
    let(:responses) { B2WImagesRequest.get }

    context 'make request to remote server' do
      it 'and return 10 image responses' do
        expect(responses.length).to eq 10
      end

      it 'and all items is instance of ImageResponse' do
        expect(responses).to all( be_instance_of ImageResponse )
      end
    end
  end

end