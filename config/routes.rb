Rails.application.routes.draw do
  root to: "application#cookie"
  devise_for :admins
  namespace :api , defaults: {format: :json}  do
    namespace :v1 do
      get 'posts', to: 'posts#index' 
      get 'posts/show'
      post 'posts/create'
      get 'admins',to: 'admins/lists#index'
      get 'admin',to: 'admins/lists#show'

      devise_scope :admin do
        post 'admins/sign_in', to: 'admins/sessions#create'
        delete 'admins/sign_out', to: 'admins/sessions#destroy'
      end
    end
  end
  # devise for admin api v1 routes
#   scope :api, defaults: { format: :json } do
#   scope :v1 do
#     devise_for :admins, controllers: {
#       sessions: 'admins/sessions',
#       registrations: 'admins/registrations'
#     }
#   end
# end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
