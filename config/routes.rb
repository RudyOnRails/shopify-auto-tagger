OtaboAutoTagger::Application.routes.draw do
  
  post 'orders' => 'orders#auto_tag'

end
