class Post < ApplicationRecord
  belongs_to :category, optional: true

  validates :title, presence: true, uniqueness: { scope: :author_id, case_sensitive: false}
  validates :body, length: { minimum: 10 }

end
