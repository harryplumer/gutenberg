Rails.application.routes.draw do
  root to: "home#index"
  get 'home/index'

  resources :emails 
  resources :people 
  resources :import_files
  get "/setup_queue", to: "people_emails_controller#setup_queue", as: "setup_queue"
  post "/queue_messages", to: "people_emails_controller#queue_messages", as: "queue_messages"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
