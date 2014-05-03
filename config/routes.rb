Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :attendees

  resources :feedbacks, only: [:new, :create]

  root to: "home#index"
end
