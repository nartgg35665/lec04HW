Rails.application.routes.draw do
  root to: "main#index"
  get 'main/test'
  get 'main/result'
  post 'main/test' 
  # post 'main/check'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
