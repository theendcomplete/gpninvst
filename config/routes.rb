Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  default_url_options host: Rails.application.config.domain
  root to: 'application#root'
  get '/404', to: 'application#handle_error_404'
  get '/500', to: 'application#handle_error_500'

  post '/graphql', to: 'graphql#execute'

  get 'events/confirm/:uuid',
      to: 'events#confirm',
      as: 'confirm_event',
      defaults: { format: 'html' }

  get 'events/decline/:uuid',
      to: 'events#decline',
      as: 'decline_event',
      defaults: { format: 'html' }

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      namespace :users do
        resource :auth
        resources :actions, param: :token, only: %i[show update create]
        resource :profile
      end
      resources :users do
        post :password
        collection do
          post :import
        end
        resources :notes, only: %i[index create]
      end
      resources :investors do
        collection do
          post :import
          get :values
        end
        resources :notes, only: %i[index create]
      end
      resources :notes
    end
  end
end
