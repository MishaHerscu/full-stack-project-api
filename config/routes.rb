Rails.application.routes.draw do
  resources :assists, except: [:new, :edit]
  resources :goals, except: [:new, :edit]
  resources :games, except: [:new, :edit]
  resources :players, except: [:new, :edit]
  resources :teams, except: [:new, :edit]
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  delete '/delete-account/:id' => 'users#destroy'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
end
