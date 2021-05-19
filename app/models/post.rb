class Post < ApplicationRecord
  belongs_to :blog, optional: true
  has_many :post_tags
  has_many :comments
end
