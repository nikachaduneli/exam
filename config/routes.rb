Rails.application.routes.draw do
  root 'pages#index'
  resources :bookings
  resources :rooms
  resources :hotels


  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, except: [:new]

  get 'booking_reports', to: 'reports#booking_report'

end
