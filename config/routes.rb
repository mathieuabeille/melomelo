Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :clothes, only: :index do
    resources :baskets, only: :create
  end
  resources :baskets, only: [:index, :destroy]
  resources :wishes, only: [:index, :new, :create, :edit, :update, :destroy]
end



# Rails.application.routes.draw do
#   devise_for :users,
#     controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

#   resources :stages, only: [:index, :show,:new, :create, :edit, :update, :destroy] do
#     resources :bookings, only: [ :create ]
#   end

#   resources :bookings, only: :index

#   root to: 'pages#home'
#   get '/me/stage', to: 'stages#mystage'
# end
