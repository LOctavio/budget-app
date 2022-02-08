class AddRefsToProductsGroups < ActiveRecord::Migration[7.0]
  def change
    add_reference :products_groups, :product, null: false, foreign_key: true
    add_reference :products_groups, :group, null: false, foreign_key: true
  end
end
