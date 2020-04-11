Rails.application.routes.draw do
  root to: 'tops#index'
  get 'tops' => 'tops#about'
  devise_for :users
  resources :users,only:[:index, :show, :edit, :update]
  resources :books,only:[:index, :show, :edit,:create,:update]
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end
