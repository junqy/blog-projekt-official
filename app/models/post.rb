class Post < ApplicationRecord
  belongs_to :blog
  has_many :post_tags
  has_many :comments
end
