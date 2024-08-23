class DropArticleCategories < ActiveRecord::Migration[7.1]
  def change
    drop_table :articlecategories
  end
end
