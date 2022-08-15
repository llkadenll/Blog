class Post < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user

  validates :title, presence: true, uniqueness: { scope: :user, case_sensitive: false}
  validates :body, length: { minimum: 10 }
  validates :public, presence: true
end
