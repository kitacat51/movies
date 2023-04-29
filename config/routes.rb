Rails.application.routes.draw do
  
# 顧客用 
  devise_for :users, skip: [:passwords],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

# 管理者用
 devise_for :admin,skip: [:registrations, :passwords] , controllers: {
     sessions: "admin/sessions"
   }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    root to: "homes#top" 
  
    get "/about" =>"homes#about",as: 'about'
    get "/users/mypage" =>"users#mypage",as: 'mypage'
    get "/users/information/edit" =>"users#edit",as: 'edit'
    patch "/users/information" =>"users#update",as: 'update'
    resources :movies
  
  
  end
  
   get '/admin' => "admin/homes#top"
  namespace :admin do
 
    resources :movies
    resources :users
    resources :homes
    resources :genres
 
  end
 
end
