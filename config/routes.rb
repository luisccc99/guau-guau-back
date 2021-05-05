Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
      post 'login', action: :login, controller: :auth
        #Posts Table
        get 'posts', action: :index, controller: :posts
        get 'post', action: :show, controller: :posts
        post 'posts', action: :create, controller: :posts
        patch 'post', action: :update, controller: :posts
        delete 'post', action: :destroy, controller: :posts

        #Users Table
        get 'users', action: :index, controller: :users
        get 'user', action: :show, controller: :users
        post 'users', action: :create, controller: :users
        patch 'user', action: :update, controller: :users
        delete 'user', action: :destroy, controller: :users

        #Comments Table
        get 'comments', action: :index, controller: :comments
        get 'comment', action: :show, controller: :comments
        post 'comments', action: :create, controller: :comments
        patch 'comment', action: :update, controller: :comments
        delete 'comment', action: :destroy, controller: :comments

      end
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
