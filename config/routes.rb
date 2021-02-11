Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        #Posts Table
        get 'get_posts', action: :getPosts, controller: :posts
        post 'post_post', action: :postPosts, controller: :posts
        patch 'patch_post', action: :patchPosts, controller: :posts
        delete 'del_post', action: :delPosts, controller: :posts

        #Localizations Table
        get 'get_local', action: :getLocalization, controller: :localizations

        #Users Table
        get 'get_users', action: :getUsers, controller: :users
        post 'post_user', action: :postUser, controller: :users
        patch 'patch_user', action: :patchUser, controller: :users
        delete 'del_user', action: :delUser, controller: :users

        #Comments Table
        get 'get_comments', action: :getComments, controller: :comments
        post 'post_comment', action: :postComment, controller: :comments
        patch 'patch_comment', action: :patchComment, controller: :comments
        delete 'del_comment', action: :delComment, controller: :comments

      end
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
