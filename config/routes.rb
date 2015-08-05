Rails.application.routes.draw do

  devise_for :users

  resources :topics do
    resources :posts, except: [:index] do
      resources :summary, only: [:new, :create, :edit, :update]
    end
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
