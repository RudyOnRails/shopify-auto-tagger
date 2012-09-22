OtaboAutoTagger::Application.routes.draw do
    post 'shopify-hook-orders' => 'shopify_hook_orders#create'
end
