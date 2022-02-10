class RenameProductsGroupsToGroupsProducts < ActiveRecord::Migration[7.0]
  def change
    rename_table :products_groups, :groups_products
  end 
end
