FactoryGirl.define do
  factory :post do
    caption "test"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/test.jpg', 'image/jpg')
  end
end