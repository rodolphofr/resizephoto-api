Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/images', to: 'image#index'
      get '/images/:id', to: 'image#show'
    end
  end
end
