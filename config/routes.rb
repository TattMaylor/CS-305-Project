Rails.application.routes.draw do
  get 'home/index'
  get 'home/login' => 'home#login'
  get 'home/logout' => 'home#logout'
  get 'home/dashboard'
  get 'home/manage'
  get 'teachers/new'
  get 'students/new'
  get 'home/game'
  get 'game/login'
  get 'game/index'
  get 'game/logout' => 'game#logout'
  get 'home/manage' => 'teacher#destroy'
  get 'game/test_one'
  get 'home/report'
  get 'home/chapterone'
  delete 'home/manage' => 'teachers#destroy'
  delete 'home/manage' => 'students#destroy'

  controller :home do
    post 'home/login' => 'home#authenticate'
  end

  controller :teachers do
    post 'teachers/new' => 'teachers#create'
  end

  controller :students do
    post 'students/new' => 'students#create'
  end

  controller :game do
    post 'game/login' => 'game#authenticate'
  end

  #controller :report_one do
    #post 'report_one/new' => 'report_one#create'
  #end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  resources :users
  resources :teachers
  resources :students
  resources :report_ones
  root 'home#login'

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
