class CreateArticleCategoriesTable < ActiveRecord::Migration[7.1]
  def change
    create_table :articlecategories do |t|
      t.belongs_to :article_id
      t.belongs_to :category_id
    end
  end
end
