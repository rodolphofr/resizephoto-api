require File.join(Rails.root, 'lib/images/image_response')

class B2WImagesRequest

  WEBSERVICE_URL = 'http://54.152.221.29/images.json'

  def self.get
    response = RestClient.get(WEBSERVICE_URL)
    json = JSON.parse(response.body)

    responses = json['images'].map do |item|
      ImageResponse.new(item['url'])
    end

    responses
  end
end