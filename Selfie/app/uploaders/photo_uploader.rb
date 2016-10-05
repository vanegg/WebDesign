class PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Que tipo de strorage usará este uploader

  def store_dir
    # Como y donde guardar el archivo ...
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  storage :file
  # Versiones del archivo ...

  version :large do
    process :resize_to_fit => [1024, 768]
  end

  version :medium, :from_version => :large do
    process :resize_to_fill => [600, 480]
  end

  version :small, :from_version => :medium do
    process :resize_to_fill => [240, 180]
  end

  version :thumb, :from_version => :small do
    process :resize_to_fill => [100, 100]
  end

  #Que extensiones vas a aceptar
   # Add a white list of extensions which are allowed to be uploaded.

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end