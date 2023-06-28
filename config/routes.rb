Rails.application.routes.draw do

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


 scope module: :public do
   root 'homes#top'
   get 'about' => 'homes#about'

    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/my_page' =>'customers#show'
   
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    
   resources :items,only:[:index,:show]

   resources :cart_items,only:[:index,:update,:create,:destroy] do
     collection do
       delete :destroy_all
     end
   end
   get 'orders/thanx' => 'orders#thanx'

   resources :orders,only:[:new,:index,:show,:create]
    post 'orders/confirm' => 'orders#confirm'



 end

devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    root to: "homes#top"
    get "/home/about" => "homes#about",as: 'about'
    resources :items, only:[:index,:new,:create,:show,:edit,:update]
    resources :customers,only:[:index,:show,:edit,:update]
    patch '/orders/:id' => "orders#update"
    resources :orders,only:[:show]
    patch '/order_items/:id' =>"order_items#update"
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end


