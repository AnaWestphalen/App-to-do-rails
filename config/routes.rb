Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :lists, only: [:destroy]
  resources :lists, only: %i[index show new create edit update] do
    resources :tasks, only: %i[index show create new]
  end
end
