Rails.application.routes.draw do

  resources :books, except: [:destroy, :update]
  resources :finished_books
  resources :genres

end
