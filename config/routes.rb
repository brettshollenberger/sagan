Rails.application.routes.draw do
  root to: "home#index"

  namespace :api, :defaults => {:format => :json} do
    resources :curricula
    resources :course_materials
    resources :users

    get "sfiles/:id/ancestors" => "sfiles#ancestors"
  end

  devise_for :users
  devise_scope :user do
    get "login", to: "devise/sessions#new"
    get "logout", to: "devise/sessions#destroy"
  end
end
