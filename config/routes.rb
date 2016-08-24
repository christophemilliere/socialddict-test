Rails.application.routes.draw do
  root 'pages#index'
  delete 'pages/:id/delete'  => 'pages#destroy', as: :delete
  resources :admins, only: [:index] do
    collection do
      get 'not_sponsorschip'
      get 'listing_sponsorship'
      get 'listing_more_sponsorship'
      get 'search_sponsorship_init'
      post 'listings_result'
      post 'more_sponsorship_result'
      post 'search_sponsorship_result'
    end
  end
  resources :sponsorships, only: [:index] do
    collection do
      post 'friend'
      get 'add_godchild'
    end
  end
  devise_for :users
end
