Rails.application.routes.draw do
  root to: "static_pages#root"

  resource :session, only:[:create, :new, :destroy]
  resources :users, only:[:new, :create] do 
    get "activation/:activation_code" => "users#activate"
  end
  
  namespace :api, defaults: {format: :json} do
    resources :programs, except:[:new, :edit] do 
      get "program_files" => "program_files#program_index"
      get "sections" => "sections#program_index"

      get "survey_answers" => "survey_answers#subject_index"
      post "survey_answers" => "survey_answers#answer_questions"
    end
    resources :sections, only: [:index, :update, :edit, :new, :create, :destroy] do
      post "enroll" => "enrollments#enroll"
    end
    resources :program_files, only: [:destroy]
    resources :enrollments, only: [:create, :update, :destroy] do
      put "approve" => "enrollments#approve"
    end
    resource :enrollments, only: [] do 
      get "search" => "enrollments#search_index"
    end
    resource :user, only: [:show, :update] do
      get "sections" => "sections#user_index"
      post "password" => "users#change_password"
    end
    resource :users, only: [:index] do
      get "instructors" => "users#instructors"
      get "admins" => "users#admins"
      get "sections" => "sections#users_index"
    end
    resources :campuses, only: [:index, :show, :update, :create, :destroy] do 
      get "survey_answers" => "survey_answers#subject_index"
      post "survey_answers" => "survey_answers#answer_questions"
    end
    resources :announcements, only: [:show, :update, :create, :destroy] do
      get "page/:page", action: :index, on: :collection
    end
    resources :surveys, only: [:index, :show, :create, :update, :destroy] do
      get "instructors" => "users#survey_index"
      get "programs" => "programs#survey_index"
      get "campuses" => "campuses#survey_index"

      post "instructors" => "users#reset_survey"
      post "programs" => "programs#reset_survey"
      post "campuses" => "campuses#reset_survey"

      get "questions" => "survey_questions#survey_index"
    end
    resources :survey_questions, only: [:create, :update]
    resources :users, only:[:index] do 
      get "survey_answers" => "survey_answers#subject_index"
      post "survey_answers" => "survey_answers#answer_questions"
    end
    resources :program_files, only: [:create]
  end
end
