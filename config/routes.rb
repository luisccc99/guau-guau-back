Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        #Posts Table
        get 'index', action: :index, controller: :posts
        get 'show', action: :show, controller: :posts
        post 'create', action: :create, controller: :posts
        patch 'update', action: :update, controller: :posts
        delete 'destroy', action: :destroy, controller: :posts

        #Localizations Table
        get 'index', action: :index, controller: :localizations
        get 'show', action: :show, controller: :localizations
        delete 'destroy', action: :destroy, controller: :localizations

        #Users Table
        get 'index', action: :index, controller: :users
        get 'show', action: :show, controller: :users
        post 'create', action: :creater, controller: :users
        patch 'update', action: :update, controller: :users
        delete 'destroy', action: :destroy, controller: :users

        #Comments Table
        get 'index', action: :index, controller: :comments
        get 'show', action: :show, controller: :comments
        post 'create', action: :create, controller: :comments
        patch 'update', action: :update, controller: :comments
        delete 'destroy', action: :destroy, controller: :comments

      end
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
