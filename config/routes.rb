Raa::Application.routes.draw do
  
  post ":id/follow_issue" => "followings#follow_issue", :as => "follow_issue"

  post ":id/follow_movement" => "followings#follow_movement", :as => "follow_movement"

  #movements

  match "movements" => "movements#index", :via => "get"

  post "movements/create"

  get "movements/edit"

  get "movements/delete"

  get "movements/:id/view" => "movements#view", :as => "movements_view"

  get "movements/add"

  #issues

  match "issues" => "issues#index", :via => "get"

  post "issues/create"

  get "issues/edit"

  get "issues/delete"

  get "issues/:id/view" => "issues#view", :as => "issues_view"

  get "issues/add"

  #users

  post "users/create" => "users#create"

  post "users/login" => "users#login"
  
  match "users" => "users#index", :via => "get"
 
  get "users/:id/profile" => "users#profile", :as => "users_profile"

  get "users/register"

  get "users/login"

  post "users/delete"

  get "users/logout"

  #root

  root :to => 'public#index'
end
