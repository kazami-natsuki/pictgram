Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'

  root "pages#index"
  get "pages/help"

  resources :users  
  resources :topics

  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'


  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
# # 課題
#   get '/comments/:topic_id/new', to: 'comments#new', as: 'comments'
#   post '/comments/:topic_id/create', to: 'comments#create', as:'comments_create'

#   resources :comments

  get 'comment/new'

  resources :topics do
    resources :comments
  #/topics/:topic_id/comment/newのパスが使用できる
  end
end