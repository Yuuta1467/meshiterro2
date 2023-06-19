Rails.application.routes.draw do

  namespace :public do
    get 'post_comments/edit'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/check'
  end
  namespace :public do
    get 'post_images/new'
    get 'post_images/index'
    get 'post_images/show'
    get 'post_images/edit'
  end
  namespace :public do
    get 'homes/top'
  end
  devise_for :users, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers:{
    sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
