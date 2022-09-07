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
    resources :articles, only: %i[create show]
    resources :users, only: :index do
      collection do
        get 'search', to: 'search'
        get 'following_user_articles', to: 'following_user_articles'
        get 'list_of_following_or_followers', to: 'list_of_following_or_followers'
      end
      member do
        post 'follow', to: 'follow'
        put 'accept', to: 'accept'
        delete 'unfollow', to: 'unfollow'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
