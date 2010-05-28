ActionController::Routing::Routes.draw do |map|
  map.resources :areas

  map.resources :curriculos

 


  map.root :controller => "noticias", :action => "index"
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.activate '/activate/:id', :controller => 'accounts', :action => 'show'
  map.forgot_password '/forgot_password', :controller => 'passwords', :action => 'new'
  map.reset_password '/reset_password/:id', :controller => 'passwords', :action => 'edit'
  map.change_password '/change_password', :controller => 'accounts', :action => 'edit'
  map.test_selection '/user/:user_id/test_selection', :controller => 'results', :action => 'test_selection'
  map.test_results '/user/:user_id/test_results', :controller => 'results', :action => 'test_results'

  #test_tab_question_tabs_url and edit_test_tab_question_tab_path.
  map.resources :test_tabs, :has_many => :question_tabs
  
  #test_questions_url and edit_test_question_path.
  map.resources :tests, :has_many => :questions
  
  map.resources :users, :has_many => :tests, :shallow => true
  map.resources :users, :has_one => :curriculo

  map.connect 'curriculo/print', :controller => 'curriculos', :action => 'print' 
 
  
  map.resources :users, :has_many => :allow_tests, :shallow => true
  
  map.resources :users, :member => { :enable => :put } do |users|
    users.resource :account
    users.resources :roles
  end
  
  map.resources :selections, :as => "selecoes"

  map.resources :noticias
  
  map.resource :session
  
  map.resource :password
  
  map.resources :servicos
  
  map.resources :allow_tests, :new => { :results => :get }

  map.resources :whos, :as => "quem_somos"

  map.resources :contatos
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
end
