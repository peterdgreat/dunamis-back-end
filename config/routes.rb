Rails.application.routes.draw do
  # devise for admin api v1 routes
  scope :api, defaults: { format: :json } do
  scope :v1 do
    devise_for :admins, controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations'
    }
  end
end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
