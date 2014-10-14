Rails.application.routes.draw do
  root to: "static_pages#root"
  resource :session, only:[:create, :new, :destroy]
  resources :users, only:[:new, :create]
  
  namespace :api, defaults: {format: :json} do
    resources :programs, except:[:new, :edit] do 
      get "program_files" => "program_files#program_index"
    end
    resources :program_files, only: [:destroy]
    resources :enrollments, only: [:create, :update, :destroy]
    resource :user, only: [:show, :update] do
      get "programs" => "programs#user_index"
    end
    resource :users, only: [:index] do
      get "instructors" => "users#instructors"
      get "admins" => "users#admins"
    end
    resources :campuses, only: [:index, :show, :update, :create, :destroy]
    resources :announcements, only: [:show, :update, :create, :destroy] do
      get "page/:page", action: :index, on: :collection
    end
    resources :users, only:[:index]
    resources :program_files, only: [:create]
  end
end
