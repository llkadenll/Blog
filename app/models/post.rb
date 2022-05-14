class Post < ApplicationRecord
  belongs_to :category, optional: true

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
end
