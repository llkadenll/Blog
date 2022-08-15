class Category < ApplicationRecord
  has_many :posts

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :icon, presence: true
  validates :color, presence: true
end
