class AddAdminToUsers < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :admin, :boolean, default: false
  end

  def down
    remove_column :users, :admin, :boolean, default: false
  end
end
