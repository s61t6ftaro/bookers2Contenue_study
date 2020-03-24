Rails.application.routes.draw do
  root to: 'tops#index'
  devise_for :users
  get 'tops' => 'tops#about'
  resources :users,only:[:index, :show, :edit, :update]
end
