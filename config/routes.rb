Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #基本ルーティングの省略形
  resources :messages
  
  #トップページアクセス時のルーティング
  root to: 'messages#index'
end
