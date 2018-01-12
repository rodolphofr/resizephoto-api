class Image
  include Mongoid::Document

  store_in collection: 'images'

  field :url, type: String
  field :formats, type: Array

  index({ url: 1 }, { unique: true, name: 'url_index' })

  validates_uniqueness_of :url
end
