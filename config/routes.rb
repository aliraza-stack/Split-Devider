Rails.application.routes.draw do
	root :to => "entries#form"
  devise_for :users,
  controllers:
  { 
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmation: 'users/confirmation',
    unlocks: 'users/unlocks',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'

  }

  get 'not_authorized' => 'entries#not_authorized'
  resources :users do
    resources :groups do
      member do
      post 'add_member'
    end
      resources :entries
    end
  end
  resources :entries do
    member do
      post 'calculation'
    end
  end
end
