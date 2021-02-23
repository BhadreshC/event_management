Rails.application.routes.draw do
  devise_for :users, path: '', path_names:{
    sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' 
  }
  root to: redirect("/login")
    get 'events_list', to:'events#events_list'
    resources :events do
    resources :budget_lists, except: [:index, :show]
    resources :expenses, except: [:index, :show]
    get 'add_member', to:'users#add_member'
    post 'users', to:'users#create_member'
  end
  # match '/*path', to: 'errors#error_404', via: :all
end