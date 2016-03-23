class Micropost < ActiveRecord::Base
    #userと関連付け
    belongs_to :user
    
    #投稿の並び順を変える
    default_scope -> { order(created_at: :desc) }
    
    #モデルに画像を追加
    mount_uploader :picture, PictureUploader
    
    #検証
    validates :user_id , presence: true
    validates :content , presence: true , length: { maximum: 140 } 
    validate :picture_size
    
    private
    #アップロード画像のサイズを検証する
    def picture_size
        if picture.size > 5.megabytes
            errors.add(:picture,"should be less than 5MB")
        end
    end
    
end
