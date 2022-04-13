Rails.application.routes.draw do
  root to: "application#cookie"
  devise_for :admins
  namespace :api , defaults: {format: :json}  do
    namespace :v1 do
      get 'posts', to: 'posts#index' 
      get 'posts/show'
      post 'posts/create'
      get 'admins',to: 'admins/lists#index'

      devise_scope :admin do
        post 'admins/sign_in', to: 'admins/sessions#create'
        delete 'admins/sign_out', to: 'admins/sessions#destroy'
      end
    end
  end
end
