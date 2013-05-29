Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :locales do
      member do
        get :all
        get :updated
      end
      
      collection do
        get :search
      end
    end
  end
end
