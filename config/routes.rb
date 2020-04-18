Rails.application.routes.draw do
  root "courses#index"

  resources :courses, only: [:show]
  resources :students, except: [:destroy]
  resources :logins, only: [:new, :create, :destroy]

  post "enroll_in_course", to: "student_courses#create"
end
