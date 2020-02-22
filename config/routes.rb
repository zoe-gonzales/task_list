Rails.application.routes.draw do
  root 'application#hello'
  resources :users
  resources :tasks
  resources :tasks do
    resources :sub_tasks
  end
  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html
  get 'hello' => 'application#hello'
  get 'goodbye' => 'application#goodbye'
end
