class DropTableArticleCategories < ActiveRecord::Migration[7.1]
  def change
    drop_table :article_categories
  end
end
