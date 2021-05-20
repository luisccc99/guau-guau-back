class Api::V1::PostsController < ApplicationController
#Get the id before request for update, delete or find.
    #before_action :authorization, only: [:create, :index, :update, :destroy, :show]
    before_action :get_post_id, only: [:update, :destroy, :show]
    
    #GET
    def index
        posts = Post.where("resolved = false", params[:resolved])
        exclude_columns = ['user_id'];
        columns = Post.where("resolved = false", params[:resolved]) - exclude_columns

        if !posts.empty?
            #render json: posts, status: :ok
                paginate Post.unscoped.all.select("body, posts.created_at, posts.id, publi_photo, resolved, resolved_reason, title, posts.updated_at, longitude, latitude, user_id, users.name, users.lastname, users.user_photo").joins(:user).where("resolved = false", params[:resolved]).order(created_at: :desc), per_page: 10#unscoped.joins(:user).includes(:user)#.where("resolved = false", params[:resolved])#.where(user_id: params[:user_id]), per_page: 10
        else
            render json: {message: "There's nothing here yet."}, status: :no_content
        end
    end

     #GET
    #singularGet
    def show
        if @found
            render json: @found, status: :ok
        else
            render json: {message: "Not found."}, status: :no_content
        end
    end
   
    #POST
    def create
        new_post = Post.new(post_params)
        
        if new_post.save()
            new_post.reload
            render json: new_post, status: :ok
        else
            render json: {message: "Unable to add new post."}, status: :conflict
        end
    end
    
    #PATCH
    def update
        if @found
            if @found.user_id != @user.id
                render json: {message: "Access unauthorized."}, status: :unauthorized
            else
                if @found.update(post_params)
                    @found.reload
                    render json: @found, status: :ok
                else
                    render json: {message: "Failed to update."}, status: :unprocessable_entity
                end
            end
        else
            render json: {message: "Post not found"}, status: :no_content
        end
    end

    #DELETE
    def destroy
        if @found
            if @found.user_id != @user.id
                render json: {message: "Access unauthorized."}, status: :unauthorized
            else
                if @found.destroy()
                    render json: {message: "Post destroyed"}, status: :ok
                else
                    render json: {message: "Failed to delete"}, status: :conflict
                end
            end
        else
            render json: {message: "Post not found"}, status: :no_content
        end
    end

    private
    def post_params
        params.permit(:title, :body, :publi_photo, :resolved, :resolved_reason, :longitude, :latitude, :user_id)
    end
    def get_post_id
        @found = Post.find(params[:id])
       # @user = User.all
    end
end