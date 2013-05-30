Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :locales do
      member do
        get :all
        get :updated
      end
      
      collection do
        get :search
        post :dump_all # todo add link to this action in views
        get :stats # todo add link to this action in views
      end
    end
  end
end
