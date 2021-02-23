class UserPhotoUploader < CarrierWave::Uploader::Base
  require 'faker'
  include Cloudinary::CarrierWave
  process :convert => 'jpg'


  def extension_whitelist
    %w(jpg jpeg gif png)
  end
  process :assign_tags

  def assign_tags      
    return :tags => ['user_pic', Faker::TvShows::MichaelScott.quote]      
  end
  
  def public_id
    basename = "users/#{Cloudinary::Utils.random_public_id}"
  end
end
