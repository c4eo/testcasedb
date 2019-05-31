TestDB::Application.routes.draw do
  resources :stencils
  # Get the test plans for a product (for assignment form)
  match 'stencils/update_test_plan_select/:id', :controller=>'stencils', :action => 'update_test_plan_select', :via => [:get, :post, :patch, :delete, :put]
  # The route below is somewhat dangerous, but is actually a dumby.
  # In order to make the test plan jquerywork in the schedule form, we make this fake url
  # and then append the id in javascript. This should newver be called directly. Only the line above should be called
  # you must use the :as path for new and edit forms
  match 'stencils/update_test_plan_select/', :controller=>'stencils', :action => 'update_test_plan_select', :as => 'jquery_matrix_test_plan_update', :via => [:get, :post, :patch, :delete, :put]
  match 'stencils/create_new_version/:id', :controller => 'stencils', :action => 'create_new_version', :as => 'create_new_stencil_version', :via => [:get, :post, :patch, :delete, :put]
	
  resources :tags

  resources :schedules
  # Get the test plans for a product (for assignment form)
  match 'schedules/update_test_plan_select/:id', :controller=>'schedules', :action => 'update_test_plan_select', :via => [:get, :post, :patch, :delete, :put]
  # The route below is somewhat dangerous, but is actually a dumby.
  # In order to make the test plan jquerywork in the schedule form, we make this fake url
  # and then append the id in javascript. This should newver be called directly. Only the line above should be called
  # you must use the :as path for new and edit forms
  match 'schedules/update_test_plan_select/', :controller=>'schedules', :action => 'update_test_plan_select', :as => 'jquery_schedule_test_plan_update', :via => [:get, :post, :patch, :delete, :put]


  resources :devices

  resources :custom_fields

  # Web API v1 route
  post "webapi/run"
  
  # Web API v2 routes
  post 'api/:object/:endpoint', to: 'webapiv2#run',       via: [:post]
  post 'api/*other',            to: 'webapiv2#invalid',   via: [:post]

  resources :tasks do
    resources :comments
  end
  match 'my/tasks/', :controller => 'tasks', :action => 'my_index', :as => 'my_tasks', :via => [:get, :post, :patch, :delete, :put]

  resources :reports
  # Get the versions for a product (for reports form)
  match 'reports/update_version_select/:id', :controller=>'reports', :action => 'update_version_select', :via => [:get, :post, :patch, :delete, :put]
  # The route below is somewhat dangerous, but is actually a dumby.
  # In order to make the uodate_version_select jquerywork in the reports form, we make this fake url
  # and then append the id in javascript. This should newver be called directly. Only the line above should be called
  # you must use the :as path for new and edit forms
  match 'reports/update_version_select/', :controller=>'reports', :action => 'update_version_select', :as => 'jquery_report_version_update', :via => [:get, :post, :patch, :delete, :put]
  # Run a report
  match 'reports/run/:id', :controller=>'reports', :action => 'run', :as => 'run_report', :via => [:get, :post, :patch, :delete, :put]
  
  resources :results
  match 'results/:id/compare', :controller => 'results', :action => 'compare', :as => 'compare_results', :via => [:get, :post, :patch, :delete, :put]

  resources :assignments do
    resources :tasks
  end
  
  # Get the versions and test plans for a product (for assignment form)
  match 'assignments/update_version_select/:id', :controller=>'assignments', :action => 'update_version_select', :via => [:get, :post, :patch, :delete, :put]
  match 'assignments/update_test_plan_select/:id', :controller=>'assignments', :action => 'update_test_plan_select', :via => [:get, :post, :patch, :delete, :put]
  match 'assignments/update_stencil_select/:id', :controller=>'assignments', :action => 'update_stencil_select', :via => [:get, :post, :patch, :delete, :put]
  # The 2 routes below below somewhat dangerous, but are actually dumbies.
  # In order to make the uodate_version_select and test plan jquerywork in the assignments form, we make this fake url
  # and then append the id in javascript. This should newver be called directly. Only the line above should be called
  # you must use the :as path for new and edit forms
  match 'assignments/update_version_select/', :controller=>'assignments', :action => 'update_version_select', :as => 'jquery_assignment_version_update', :via => [:get, :post, :patch, :delete, :put]
  match 'assignments/update_test_plan_select/', :controller=>'assignments', :action => 'update_test_plan_select', :as => 'jquery_assignment_test_plan_update', :via => [:get, :post, :patch, :delete, :put]
  match 'assignments/update_stencil_select/', :controller=>'assignments', :action => 'update_stencil_select', :as => 'jquery_assignment_stencil_update', :via => [:get, :post, :patch, :delete, :put]
    
  # Download an attachment  
  # Had to swap to asterisk. Called globbing. Used in case there is filename with multiple periods.
  match 'uploads/:id/:style/*filename.:format', :controller => 'uploads', :action => 'download', :conditions => { :method => :get }, :via => [:get, :post, :patch, :delete, :put]
  
  resources :settings

  resources :categories
  
  # Create a new category at the product level
  match 'category/new/product/:product_id', :controller => 'categories', :action => 'new_product', :as => 'new_product_category', :via => [:get, :post, :patch, :delete, :put]
  # Create a new category at the sub-category level
  match 'category/new/category/:category_id', :controller => 'categories', :action => 'new_category', :as => 'new_subcategory', :via => [:get, :post, :patch, :delete, :put]
  # List categories belonging to a product (for category module)
  match 'category/list/:product_id', :controller => 'categories', :action => 'list', :as => 'list_product_categories', :via => [:get, :post, :patch, :delete, :put]
  # List categories belonging to another category (for category module)
  match 'category/list_children/:category_id', :controller => 'categories', :action => 'list_children', :as => 'list_category_children', :via => [:get, :post, :patch, :delete, :put]
  # List categories belonging to a product (for test case module)
  match 'test_cases/list/:product_id', :controller => 'test_cases', :action => 'list', :as => 'list_test_case_categories', :via => [:get, :post, :patch, :delete, :put]
  # List categories belonging to another category (for test case module)
  match 'test_cases/list_children/:category_id', :controller => 'test_cases', :action => 'list_children', :as => 'list_test_case_category_children', :via => [:get, :post, :patch, :delete, :put]
  # List categories belonging to a product (for test plan module)
  match 'test_plans/:plan_id/list_categories/:product_id', :controller => 'test_plans', :action => 'list_categories', :as => 'list_test_plan_categories', :via => [:get, :post, :patch, :delete, :put]
  # List categories belonging to another category (for test plan module)
  match 'test_plans/:plan_id/list_category_children/:category_id', :controller => 'test_plans', :action => 'list_category_children', :as => 'list_test_plan_category_children', :via => [:get, :post, :patch, :delete, :put]
  # Add a test case to a test plan
  match 'test_plans/:plan_id/add_case/:id', :controller => 'test_plans', :action => 'add_test_case', :as => 'add_test_case_to_plan', :via => [:get, :post, :patch, :delete, :put]
  # Remove a test case from a test plan
  match 'test_plans/:plan_id/remove_case/:id', :controller => 'test_plans', :action => 'remove_test_case', :as => 'remove_test_case_from_plan', :via => [:get, :post, :patch, :delete, :put]
  match 'test_plans/copy/:id', :controller => 'test_plans', :action => 'copy', :as => 'copy_test_plan', :via => [:get, :post, :patch, :delete, :put]
	
  # URLs for logging in and out of the application    
  match "login", :controller => "user_sessions", :action => "new", :as => "login", :via => [:get, :post, :patch, :delete, :put]
  match "logout", :controller => "user_sessions", :action => "destroy", :via => [:get, :post, :patch, :delete, :put]
  
  # List test plans belonging to a product (used on test plan index view)
  match 'test_plans/list/:product_id', :controller => 'test_plans', :action => 'list', :as => 'list_test_plans', :via => [:get, :post, :patch, :delete, :put]
  
  resources :user_sessions

  resources :authentications, :except => :destroy do
    get :delete, :action => :destroy
  end
  match '/auth/:provider/callback', to: 'authentications#create', :via => [:get, :post, :patch, :delete, :put]
  match '/auth/failure', to: 'authentications#failure', :via => [:get, :post, :patch, :delete, :put]

  match 'users/import/', :controller => 'users', :action => 'import', :as => 'import_user', :via => [:get, :post, :patch, :delete, :put]
  resources :users
  get 'users/:id/reset', :controller => 'users', :action => 'reset', :as => 'reset_user'
  match "/my_settings" => "users#my_settings", :as => 'my_settings', :via => [:get, :post, :patch, :delete, :put]
  match "/update_settings" => "users#update_my_settings", :as => 'update_my_settings', :via => [:get, :post, :patch, :delete, :put]
    
  resources :uploads do
    member do
      get 'executable'
    end
  end
  resources :versions

	get '/test_plans/search/', :controller => 'test_plans', :action => 'search', :as => 'test_plan_search'
  resources :test_plans do
	  resources :comments
  end
  match 'test_plans/create_new_version/:id', :controller => 'test_plans', :action => 'create_new_version', :as => 'create_new_test_plan_version', :via => [:get, :post, :patch, :delete, :put]
	  
  # Load the admin page
  get "admin/index", :as => 'admin'

  resources :test_types

  resources :products

	get '/test_cases/search/', :controller => 'test_cases', :action => 'search', :as => 'test_case_search'
  resources :test_cases do
	  resources :comments
	end
	get 'test_cases/new/import/', :controller => 'test_cases', :action => 'import', :as => 'import_new_test_case'
	post 'test_cases/new/import/', :controller => 'test_cases', :action => 'import_create', :as => 'import_create_test_case'  
	match 'test_cases/create_new_version/:id', :controller => 'test_cases', :action => 'create_new_version', :as => 'create_new_test_case_version', :via => [:get, :post, :patch, :delete, :put]
	match 'test_cases/copy/:id', :controller => 'test_cases', :action => 'copy', :as => 'copy_test_case', :via => [:get, :post, :patch, :delete, :put]
	
	# Test Cases - Updated the order, category
	match 'test_cases/new/:category_id', :controller=>'test_cases', :action => 'new', :as => 'new_test_case_with_category', :via => [:get, :post, :patch, :delete, :put]
  match 'test_cases/update_category_select/:id', :controller=>'test_cases', :action => 'update_category_select', :via => [:get, :post, :patch, :delete, :put]
  # The route below is somewhat dangerous, but is actually a dumby.
  # In order to make the update_category_select jquerywork in the reports form, we make this fake url
  # and then append the id in javascript. This should newver be called directly. Only the line above should be called
  # you must use the :as path for new and edit forms
  match 'test_cases/update_category_select/', :controller=>'test_cases', :action => 'update_category_select', :as => 'jquery_test_case_category_update', :via => [:get, :post, :patch, :delete, :put]
  
  match 'update_version_select/:id', :controller=>'application', :action => 'update_version_select', :via => [:get, :post, :patch, :delete, :put]
  # The route below is somewhat dangerous, but is actually a dumby.
  # In order to make the uodate_version_select jquerywork on the results index, we make this fake url
  # and then append the id in javascript. This should newver be called directly. Only the line above should be called
  # you must use the :as path for new and edit forms
  match 'update_version_select/', :controller=>'application', :action => 'update_version_select', :as => 'jquery_application_version_update', :via => [:get, :post, :patch, :delete, :put]
  
  match 'help', :controller => 'help', :action => 'index', :as => 'help', :via => [:get, :post, :patch, :delete, :put]
  # Guide root to the home module
  root :to =>  "home#index", :as => 'home'
  

end
