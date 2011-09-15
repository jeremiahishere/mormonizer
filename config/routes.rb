Mormonizer::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  namespace :admin do
    root :to => "translations#index"
    resources :translations
    resources :users
    resources :languages
  end

  root :to => "pages#index"
end
