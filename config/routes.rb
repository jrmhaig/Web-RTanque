Rails.application.routes.draw do
  devise_for :users
  root 'arena#home'

  get 'arena/home'
  get 'arena/random', defaults: { format: :json }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
