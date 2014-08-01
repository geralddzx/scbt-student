Rails.application.routes.draw do
  root to: "static_pages#root"
  resource :session, only:[:create, :new, :destroy]
  resources :users, only:[:new, :create]
  namespace :api, defaults: {format: :json} do
    resources :courses, except:[:new, :edit]
    resources :enrollments, only: [:create, :update]
    resource :user, only: [:show, :update] do
      resources :courses, only: [:index]
    end
    resource :users, only: [] do
      get "instructors" => "users#index"
    end
    resources :users, only:[:index]
  end
end
