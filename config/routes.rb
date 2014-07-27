Rails.application.routes.draw do
  root to: "static_pages#root"
  resource :session, only:[:create, :new, :destroy]
  resources :users, only:[:new, :create]
  namespace :api, defaults: {format: :json} do
    resources :courses, except:[:new, :edit]
    resources :student_enrollments, only: [:create, :update]
  end
end
