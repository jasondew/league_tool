ActionController::Routing::Routes.draw do |map|
  map.resources :memberships


  map.resource :session

  map.resources :users do |user|
    user.resources :matches
  end

  map.resources :leagues do |league|
    league.resources :users
  end

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil 

  map.root :controller => "pages", :action => "home"
end
