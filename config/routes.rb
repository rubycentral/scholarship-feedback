Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins
  devise_for :attendees, controllers: {
    omniauth_callbacks: 'attendees/omniauth_callbacks'
  }

  resources :feedbacks, only: [:new, :create]

  root to: "home#index"
end
