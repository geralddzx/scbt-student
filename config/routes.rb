Rails.application.routes.draw do
  root to: "static_pages#root"
  resource :session, only:[:create, :new, :destroy]
  resources :users, only:[:new, :create] do
    get "instructors" => "users#instructors"
  end
  namespace :api, defaults: {format: :json} do
    resources :courses, except:[:new, :edit]
    resources :enrollments, only: [:create, :update]
  end
end
