Rails.application.routes.draw do
  devise_for :attendees

  resources :feedbacks, only: [:new, :create]

  root to: "home#index"
end
