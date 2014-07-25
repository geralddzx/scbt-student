Rails.application.routes.draw do
  root to: "static_pages#root"
  resource :session, only:[:create, :new, :destroy]
  resources :users, only:[:new, :create]
  namespace :api do
    resources :courses, except:[:new, :edit]
  end
end
