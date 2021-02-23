class PostPhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  require 'faker'
  process :convert => 'jpg'


  def extension_whitelist
    %w(jpg jpeg gif png)
  end
  process :assign_tags

  def assign_tags      
    return :tags => ['lost doggo',Faker::Creature::Dog.meme_phrase]      
  end
  
  def public_id
    basename = "pupperinos/#{Cloudinary::Utils.random_public_id}"
  end
end
