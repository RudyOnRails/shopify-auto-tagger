class RenameShopifyHookOrdersTable < ActiveRecord::Migration
  def up
    rename_table :shopify_hook_orders, :orders
  end

  def down
    rename_table :orders, :shopify_hook_orders
  end
end
