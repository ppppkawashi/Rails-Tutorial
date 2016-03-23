# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
    storage :file

    #アップロードファイルの保存先ディレクトリ
    def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
        
    #アップロード可能な拡張子リスト
    def extension_white_list
        %w(jpg jpeg gif png)
    end
    
end
