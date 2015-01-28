Rails.application.routes.draw do
  get 'search/:q' => 'search#search', as: :search

  resources :solicitors do
    collection do
      get 'search/:q' => 'solicitors#search'
    end
  end

  resources :firms do
    collection do
      get 'search/:q' => 'firms#search'
    end

    resources :solicitors do
      collection do
        get 'search/:q' => 'solicitors#search'
      end
    end
  end
end
