Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

  get 'profile', to: 'users#profile'
  resources :users
  resources :projects

  root to: 'projects#index'

  # API version 1
  # By adding namespace, Rails will automatically map that namespace to a directory matching the name under the controllers folder
  namespace :api,
    :path => "", #removes 'api' from the URL path
    :defaults => {:format => :json}, #sets json as default format in our routes
    :constraints => {:subdomain => "api"} do #creates the subdomain (api.myapp...)
      namespace :v1 do
        resources :projects
      end
  end
end
