ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.

  map.login '/login/success', :controller => :login, :action => :signin#:conditions => {:method => :post}
  map.create_user '/login/create_user', :controller => :login, :action => :create_user


  #map.resources :userdetails, :only => [:update]
  map.update_user '/login/update', :controller => :login, :action => :update



  map.resources :services, :collection => { :edituser => :get, :change_password => :get}
  #map.addservice, :controller => :admin, :action => :add_service
  map.resources :admin, :collection => {:addservice => [:get], :viewservice => :get, :change_password => :get}
  #map.resources :services, :member => { :edituser => :get, :change_password => :post }
  map.resources :labor, :collection => {:list => :get, :search => :get, :dosearch => :get, :getsearchoptions => :get}
  map.resources :feedback
  map.resources :request, :collection => {:cancel => :get}, :member => {:progress => [:get, :post], :complete => [:get, :post]}
  map.resources :report, :collection => {:requestreport => [:get, :post], :laborreport => [:get, :post], :usersreport => [:get, :post], :servicesreport => [:get, :post], :feedbackreport => :get}


  #map.resources :search, :only =>[:dosearch]
   #  map.resources :login do |m|
  
 #  m.collection do
 #       get 'update'
 #     end
 # end


  #map.connect 'login/update', :controller => :login, action => :update
  #map.connect '/registration', :controller => :login, :action => :create_user
  #map.match 'login/newuser' => 'login#newuser'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
 #map.match 'login/enterworld' => 'login#enterworld', :as => :enterworld
end


 # map.with_options :controller => :loyalty_balance, :path_prefix => 'loyaltybalance' do |loyalty_balance|
 #    loyalty_balance.new_loyalty_balance '/new',
 #      :action =>     :new,
 #      :conditions => {:method => [:get]}
 #    loyalty_balance.loyalty_balance '/',
 #      :action =>     :create,
 #      :conditions => {:method => [:post]}
 #    loyalty_balance.loyalty_balance_reset_pin '/reset/pin',
 #      :action =>     :reset_pin,
 #      :conditions => {:method => [:get]}
 #    loyalty_balance.loyalty_balance_resend_pin '/reset/pin',
 #      :action =>     :resend_pin,
 #      :conditions => {:method => [:post]}
 #  end


  #map.resources :guest_segmentation, :path_prefix => 'marketing/engine/guest', :as => 'segmentation', :controller => 'guest_segmentation'
  # map.namespace :offer_incentive, :path_prefix => 'offers' do |offer|
  #   offer.resources :discounted_purchase, :collection => {:new => [:post]}
  # end