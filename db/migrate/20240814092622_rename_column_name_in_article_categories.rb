class RenameColumnNameInArticleCategories < ActiveRecord::Migration[7.1]
  def change
    rename_column :articlecategories, :article_id_id, :article_id
    rename_column :articlecategories, :category_id_id, :category_id
  end
end
