class Picture < ActiveRecord::Base
  validates :image, presence: true
  validates :title, presence: true
  belongs_to :user
  mount_uploader :image, ImageUploader
end
