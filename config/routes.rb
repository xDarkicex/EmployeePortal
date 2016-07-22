Rails.application.routes.draw do
  root 'application#welcome'
  resources :todos do
    get :toggle_done, on: :member
  end
  devise_for :users
  resources :employees
  resources :messages
  resources :pdfs do
    get :toggle_pinned, on: :member
  end
  resources :products
  resources :employees

  resources :help_tickets do
    resources :comments do
      resources :comments
    end
  end
  resources :comments
end
