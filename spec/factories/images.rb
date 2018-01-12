FactoryBot.define do
  factory :basic_image, class: Image do
    url "http://54.152.221.29/images/b737_5.jpg"
    trait :with_formats do
      before(:create) do |object, evaluator|
        object.formats = [
            "path/#{object._id}.jpg",
            "path/#{object._id}.jpg",
            "path/#{object._id}.jpg"
          ]
      end
    end
  end
end
