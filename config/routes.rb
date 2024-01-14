Rails.application.routes.draw do
 
  root "posts#index"

  resource :session, only: %i[new create destroy]

  resources :users, only: %i[new create]

  resources :questions do
    resources :answers, only: %i[create destroy edit update]
  end

  namespace :admin do
    resources :users, only: %i[index show]
    resources :questions, only: %i[new create edit update destroy show index]
    resources :pages, only: %i[index]
    resource :adminsession, only: %i[new create destroy]
    resources :posts, only: %i[new create edit update index show destroy]

    root "adminsessions#new"
  end

 # resources :questions, only: %i[index new edit create update destroy show]
  
 # get '/questions', to: 'questions#index'
 # get '/questions/new', to: 'questions#new' 
 # post '/questions', to: 'questions#create'
 # get '/questions/:id/edit', to: 'questions#edit'
# get '/questions/', to: 'questions#update'

end
