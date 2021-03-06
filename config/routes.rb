Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    resources :brands do
      get :autocomplete_brand_name, on: :collection
    end
    resources :users do
      patch :set_locale, on: :member
    end
  end

  root to: 'brands#index'
end
