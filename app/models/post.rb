class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :admin
  validates :category, presence: true
  validates :image, presence: true
end
