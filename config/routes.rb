Raa::Application.routes.draw do

  get "public/about"

  post ":id/follow_issue" => "followings#follow_issue", :as => "follow_issue"

  post ":id/follow_movement" => "followings#follow_movement", :as => "follow_movement"

  #movements

  match "movements" => "movements#index", :via => "get"

  post "movements/create"

  post "movements/:id/update" => "movements#update", :as => "movements_update"

  get "movements/:id/edit" => "movements#edit", :as => "movements_edit"

  match "movements/:id/delete" => "movements#delete", :as => "movements_delete"

  get "movements/:id/view" => "movements#view", :as => "movements_view"

  get "movements/add"

  #issues

  match "issues" => "issues#index", :via => "get"

  post "issues/create"

  post "issues/:id/update" => "issues#update", :as => "issues_update"

  get "issues/:id/edit" => "issues#edit", :as => "issues_edit"

  match "issues/:id/delete" => "issues#delete", :as => "issues_delete"

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

  #comments

  match "comments" => "comments#index", :via => "get"

  post "comments/create"

  post "comments/:id/update" => "comments#update", :as => "comments_update"

  get "comments/:id/edit" => "comments#edit", :as => "comments_edit"

  match "comments/:id/delete" => "comments#delete", :as => "comments_delete"

  get "comments/:id/view" => "comments#view", :as => "comments_view"

  get "comments/add"

  #root

  root :to => 'public#index'
end
