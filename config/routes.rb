Rails.application.routes.draw do
  get 'stats', to: "stats#index" #/stats

  resources :orders, only: [:index] #/orders

  resources :tables, except: [:new, :edit] do
    resources :orders, only: [:create] do
      post :add, on: :member
      post :pay, on: :member
    end #/tables/:id/orders
  end
end
