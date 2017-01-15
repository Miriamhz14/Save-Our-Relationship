Rails.application.routes.draw do

  devise_for :users
  root 'blog#index'

  # to make routes on browser look prettier

  get 'home' => 'blog#home'
  get 'profile' => 'blog#profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
