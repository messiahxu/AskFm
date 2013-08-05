AskFm::Application.routes.draw do
  root "static_pages#home"
  # 这是列出用户提出的问题
  # get "/questions", to: "questions#index"

  get "/timeline", to: "static_pages#timeline"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/latest", to: "static_pages#latest"

  get "/signup", to: "users#new"
  # get "/profile", to: "users#show"
  resources :users, only: [:index, :create, :show, :edit, :update, :destroy] do
    member do
      get :following, :followers
    end
    resources :questions, only: [:create] do
      resources :notifications, only: [:create]
    end
    resources :answers, only: [:show] do
      resources :notifications, only: [:create]
    end
  end

  resources :notifications, only: [:index]

  resources :relationships, only: [:create, :destroy]

  resources :questions, only: [:index] do
    resources :answers, only: [:create]
    collection do
    end
  end
  # 这是列出用户收到的问题
  get "/need-to-answer", to: "questions#need_to_answer", as: "need_to_answer"
  get "/questions/:id/reply", to: "questions#reply", as: "reply"

  get "/login", "/signin", to: "sessions#new"
  resources :sessions, only: [:create, :destroy]
  delete "/logout", "/signout", to: "sessions#destroy"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
