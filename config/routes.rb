Rails.application.routes.draw do
  resources :solicitors

  get 'search/:q' => 'search#search', as: :search

  get 'firms/search/:q' => 'firms#search', as: :firm_search
  get 'solicitors/search/:q' => 'solicitors#search', as: :solicitor_search

  resources :firms do
    resources :solicitors
  end

end
