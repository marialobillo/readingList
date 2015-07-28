Rails.application.routes.draw do

  resources :books, except: [:destroy, :update]

end
