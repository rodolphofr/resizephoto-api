class Api::V1::ImageController < ApplicationController
  def index
    @images = Image.all
    if stale?(etag: @images)
      render json: { images: @images }
    end
  end

  def show
    @image = Image.find(params[:id])
    render json: { image: @image }
  end
end
