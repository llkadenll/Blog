class ChangePublicInPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :public, :boolean, default: false
  end
end
