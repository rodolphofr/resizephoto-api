class Image
  include Mongoid::Document
  field :url, type: String
  field :formats, type: Array
end
