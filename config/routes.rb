Rails.application.routes.draw do
  resources :departamentos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #delete "produtos/:id", to: "produtos#destroy", as: :produto
  #post "produtos", to: "produtos#create"
  #get "produtos/new", to: "produtos#new"
  get "produtos/search", to: "produtos#search", as: :search_produto
  resources :produtos , only: [:new, :create, :destroy, :edit, :update]
  root to: "produtos#index"
end
