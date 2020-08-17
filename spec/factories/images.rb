FactoryBot.define do
    factory :image do
      src { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/sample.png"), 'image/png') }
    end  
  end