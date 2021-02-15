Rails.application.routes.draw do
  devise_for :users, path: '', path_names:{
    sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' 
  }
  root to: redirect("/login")
  resources :expenses
  resources :events
  match '*path', to: 'errors#error_404', via: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
