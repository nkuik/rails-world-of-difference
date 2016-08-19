# encoding: utf-8

class User::CvUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def public_id
    return model.last_name
  end
end
