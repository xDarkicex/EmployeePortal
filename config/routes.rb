Rails.application.routes.draw do

  resources :todos do
    get :toggle_done, on: :member
  end
  root 'welcome#index'

  devise_for :users
  resources :employees
  # delete 'employees/sign_out'
  resources :technicalassistances
  resources :pdfs
  resources :products
  resources :employees
  resources :help_tickets do
    resources :comments
  end
  resources :comments
end
