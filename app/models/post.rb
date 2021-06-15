class Post < ApplicationRecord
  belongs_to :blog
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true
  validate :correct_image_type
  has_one_attached :image
  has_rich_text :content

  def correct_image_type
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
      errors.add(:image, 'import in format JPEG or PNG')
    end
  end

end


