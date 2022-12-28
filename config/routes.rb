Rails.application.routes.draw do

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}



 scope module: :public do
   root 'homes#top'
   get 'about' => 'homes#about'
   resources :items,only:[:index,:show]
   resources :customers,only:[:show,:edit,:update]
   get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
   patch '/customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw'


   resources :cart_items,only:[:index,:update,:create,:destroy] do
     collection do
       delete :destroy_all
     end
   end
   resources :orders,only:[:new,:index,:show,:create] do
     collection do
       post :confirm
       get :thanx
     end
   end

 end

devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    root to: "homes#top"
    get "/home/about" => "homes#about",as: 'about'
    resources :items, only:[:index,:new,:create,:show,:edit,:update]
    resources :customers,only:[:index,:show,:edit,:update]
    resources :orders,only:[:show,:update]
    resources :order_items,only:[:update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end


