Rails.application.routes.draw do
 
  root "pages#index"

  resource :session, only: %i[new create destroy]

  resources :users, only: %i[new create]

  resources :questions do
    resources :answers, only: %i[create destroy edit update]
  end

  namespace :admin do
    resources :users, only: %i[index show]
    resources :questions, only: %i[index]

    root "pages#index"
  end

 # resources :questions, only: %i[index new edit create update destroy show]
  
 # get '/questions', to: 'questions#index'
 # get '/questions/new', to: 'questions#new' 
 # post '/questions', to: 'questions#create'
 # get '/questions/:id/edit', to: 'questions#edit'
# get '/questions/', to: 'questions#update'

end
