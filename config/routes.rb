Rails.application.routes.draw do
  resources :pictures, only: [:show, :destroy, :index, :create, :update] do
    resources :comments, only: [:index, :show, :create, :update, :destroy]
  end
end
