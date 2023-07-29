Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

    scope module: :public do
      root to: "homes#top"

      resources :post_images, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
        resource :favorites, only: [:create, :destroy]
        resources :post_comments, only: [:create, :edit, :update, :destroy] do
          resource :likes, only: [:create, :destroy]
        end
      end

      resources :users, only: [:show, :edit, :update] do
        member do
          get :favorites
        end
      end

      get 'users/:id/check' => 'users#check', as: 'check'
      patch 'users/:id/withdraw' => 'users#withdraw', as: 'withdraw'

      post '/post_images/guest_sign_in', to: 'post_images#guest_sign_in'

    end

  devise_for :admin, skip: [:registrations, :passwords], controllers:{
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root to: "homes#top"

    resources :post_images, only: [:index, :destroy] do
      resources :post_comments, only: [:index, :show, :edit, :update, :destroy]
    end

    resources :tags, only: [:index, :create, :edit, :update, :destroy]

    resources :users, only: [:index, :show, :edit, :update]

  end
end