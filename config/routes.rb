Rails.application.routes.draw do
  # root to: "application#cookie"
  devise_for :admins
  namespace :api , defaults: {format: :json}  do
    namespace :v1 do
      get 'posts', to: 'posts#index' 
      get 'posts/show'
      post 'posts/create'
      delete 'posts/:id/destroy', to: 'posts#destroy'
    #  get 'admin',to: 'admins/lists#current_user'

      devise_scope :admin do
        post 'admins/sign_in', to: 'admins/sessions#create'
 get  'admin',to: 'admins/sessions#current_admin'
        delete 'admins/sign_out', to: 'admins/sessions#destroy'
      end
    end
  end
end
