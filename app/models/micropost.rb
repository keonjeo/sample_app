class Micropost < ApplicationRecord

  mount_uploader :picture, PictureUploader
  
  # Validations
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size

  # Associations
  belongs_to :user

  # Scopes
  default_scope                                       -> { order(created_at: :desc) }

  private

  # 验证上传的图像大小
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

end
