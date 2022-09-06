Rails.application.routes.draw do
  devise_for :users,
             defaults: { format: :json },
             path: '',
             path_names: {
               sign_in: 'api/login',
               sign_out: 'api/logout',
               registration: '/sign_up'
             },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
    
  constraints format: :json do
    namespace :api do
      resources :users, only: :index
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
