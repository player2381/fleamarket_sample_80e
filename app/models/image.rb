class Image < ApplicationRecord
  mount_uploader :src, ImageUploader
  belongs_to :production

  # validates :src, presence: true
end
