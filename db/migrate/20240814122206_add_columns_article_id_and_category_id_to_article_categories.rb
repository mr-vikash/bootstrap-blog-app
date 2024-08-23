class AddColumnsArticleIdAndCategoryIdToArticleCategories < ActiveRecord::Migration[7.1]
  def up
    add_column :article_categories, :article_id,  :int
    add_column :article_categories, :category_id, :int
  end

  def down
    remove_column :article_categories, :article_id, :int
    remove_column :article_categories, :category_id, :int
  end
end
