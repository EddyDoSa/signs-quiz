Rails.application.routes.draw do
  
  devise_for :users #, :controllers => {:registrations => "users/registrations"}
  
  resources :users, only: [:index, :show, :edit, :update, :destroy]
    
  get 'quiz_submissions/create'
  get 'quiz_submissions/show'

  resources :quizzes do
    resources :questions
    # post 'submit', to: 'quiz_submissions#create'
    resources :quiz_submissions, only: [:show, :create], as: 'submissions'
  end

  root 'quizzes#index'
end
