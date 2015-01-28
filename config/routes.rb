Rails.application.routes.draw do
  match 'search', to: 'search#search', via: [:post]

  resources :solicitors do
    collection do
      match 'search', to: 'solicitors#search', via: [:post]
    end
  end

  resources :firms do
    collection do
      match 'search', to: 'firms#search', via: [:post]
    end

    resources :solicitors do
      collection do
        match 'search', to: 'solicitors#search', via: [:post]
      end
    end
  end
end
