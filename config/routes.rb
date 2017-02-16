Rails.application.routes.draw do

  root 'pages#home'
  get 'bs_erb', to: 'pages#bs_erb'
  get 'bs_slim', to: 'pages#bs_slim'

  devise_for  :users, path: '',
              path_names: { sign_up: 'login', sign_out: 'logout', edit: 'profile'},
              controllers: {  omniauth_callbacks: 'omniauth_callbacks',
                              registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]
end
