Rails.application.routes.draw do
  root 'post_images#top'
  devise_for :users
  resources :post_images, only: [:index, :show, :new, :create] do
  	resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update, :destroy] do
  	resource :post_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
