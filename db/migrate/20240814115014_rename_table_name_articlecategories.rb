class RenameTableNameArticlecategories < ActiveRecord::Migration[7.1]
  def change
    rename_table :articlecategories, :article_categories
  end
end
