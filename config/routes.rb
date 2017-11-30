Rails.application.routes.draw do
  root :to => 'home#index'

  resources :photos do
    member do
      put "like", to: "photos#upvote"
      put "dislike", to: "photos#downvote"
    end
    resources :tags
  end


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    get :autocomplete_user_first_name, :on => :collection
  end
end
