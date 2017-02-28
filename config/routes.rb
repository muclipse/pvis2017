Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'single_page#home'
  
  get 'committee' => 'single_page#committee', :as=>"committee"

  get 'venue' => 'single_page#venue', :as=>"venue"

  get 'registration' => 'single_page#registration', :as=>"registration"

  get 'cfp' => 'call_for_participation#index', :as=>"cfp"

  scope "/cfp" do
    get 'paper' => 'call_for_participation#paper', :as=>"cfp_paper"
    get 'visualization_notes' => 'call_for_participation#visualization_notes', :as=>"cfp_note"
    get 'posters' => 'call_for_participation#posters', :as=>"cfp_poster"
    get 'contest' => 'call_for_participation#contest', :as=>"cfp_contest"
  end

  get 'programs' => 'programs#index', :as=>"programs" 

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
