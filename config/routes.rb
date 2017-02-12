Rails.application.routes.draw do
  get 'arena/home'
  get 'arena/random', defaults: { format: :json }

  get 'user/register'

  root 'user#register'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
