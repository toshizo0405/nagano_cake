Rails.application.routes.draw do

  namespace :admin do
    root to: "homes#top"
    resources :items, only:[:index,:new,:create,:show,:edit,:update]
    resources :customers,only:[:index,:show,:edit,:update]
    resources :orders,only:[:show,:update]
    resources :order_items,only:[:update]
  end
  devise_for :admins
  devise_for :customers

   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
