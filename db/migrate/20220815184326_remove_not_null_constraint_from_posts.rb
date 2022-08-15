class RemoveNotNullConstraintFromPosts < ActiveRecord::Migration[7.0]
  def change
    change_column_null :posts, :category_id, true
  end
end
