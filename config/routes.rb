Blogged::Application.routes.draw do
  root :to => "articles#index"
  devise_for :users
  resources :users do
    collection do
      get 'edit_profile'
    end
  end
  resources :articles do
    collection do
      get 'list'
    end
    member do
      get 'publish'
    end
  end

  #match ':controller(/:action(/:id))(.:format)'
end