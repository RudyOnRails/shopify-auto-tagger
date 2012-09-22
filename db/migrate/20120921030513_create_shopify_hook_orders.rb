class CreateShopifyHookOrders < ActiveRecord::Migration
  def change
    create_table :shopify_hook_orders do |t|
      t.integer :customerid

      t.timestamps
    end
  end
end
