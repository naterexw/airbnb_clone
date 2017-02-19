Rails.application.routes.draw do
  root 'pages#home'
  get 'bs_erb', to: 'pages#bs_erb'
  get 'bs_slim', to: 'pages#bs_slim'

  devise_scope :user do
    get 'profile/edit', to: 'devise/registrations#edit', as: :edit_user_registration
    get 'profile/cancel', to: 'devise/registrations#cancel', as: :cancel_user_registration
  end

  devise_for :users,  path: '',
                      path_names: { sign_in: 'login',
                                    sign_out: 'logout',
                                    sign_up: '',
                                    registration: 'signup',
                                    edit: 'profile',
                                    cancel: 'cancel',
                                    confirmation: 'verification' },
                      controllers: {  omniauth_callbacks: 'users/omniauth_callbacks',
                                      # sessions: 'users/sessions',
                                      registrations: 'users/registrations' }

  resources :users, only: [:show]
  resources :rooms
  resources :photos
end
