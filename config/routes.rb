Notepatrol::Application.routes.draw do
  authenticated :user do
    root :to => 'notes#index'
  end
  root :to => "notes#index"
  devise_for :users
  resources :users
    resources :students
    resources :notes
    resources :categories
    resources :forms
    resources :yeargroups

    match 'go_yeargroup' => 'yeargroups#show', :as => :go_yeargroup
    match 'go_form' => 'forms#show', :as => :go_form
    
    match 'import_students' => 'students#import', :as => :import_students
    match 'import_users' => 'users#import', :as => :import_users
    
    match 'new_note_comment' => 'notes#comment_add', :as => :new_note_comment
    
end