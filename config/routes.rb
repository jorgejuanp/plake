Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

  get 'profile', to: 'users#profile'
  resources :users
  resources :projects

  root to: 'projects#index'


  get 'list', to: 'projects#projects_as_json'
end
