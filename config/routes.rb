Raa::Application.routes.draw do

  get "public/about"

  post ":id/follow" => "followings#follow", :as => "follow"

  #topics

  match "topics" => "topics#index", :via => "get"

  post "topics/create"

  post "topics/:id/update" => "topics#update", :as => "topics_update"

  get "topics/:id/edit" => "topics#edit", :as => "topics_edit"

  match "topics/:id/delete" => "topics#delete", :as => "topics_delete"

  get "topics/:id/view" => "topics#view", :as => "topics_view"

  get "topics/add"

  #issues

  match "issues" => "issues#index", :via => "get"

  post "issues/:movement_id/create" => "issues#create", :as => "issues_create"

  post "issues/:id/update" => "issues#update", :as => "issues_update"

  get "issues/:id/edit" => "issues#edit", :as => "issues_edit"

  match "issues/:id/delete" => "issues#delete", :as => "issues_delete"

  get "issues/:id/view" => "issues#view", :as => "issues_view"

  get "issues/:movement_id/add" => "issues#add", :as => "issues_add"

  #users

  post "users/register" => "users#create"

  post "users/login" => "users#login"
  
  match "users" => "users#index", :via => "get"
 
  get "users/:id/profile" => "users#profile", :as => "users_profile"

  get "users/register"

  get "users/login"

  post "users/delete"

  get "users/logout"

  #comments

  match "comments" => "comments#index", :via => "get"

  post "comments/:issue_id/create" => "comments#create", :as => "comments_create"

  post "comments/:id/update" => "comments#update", :as => "comments_update"

  get "comments/:id/edit" => "comments#edit", :as => "comments_edit"

  match "comments/:id/delete" => "comments#delete", :as => "comments_delete"

  get "comments/:id/view" => "comments#view", :as => "comments_view"

  get "comments/add"

  #root

  root :to => 'public#index'
end
