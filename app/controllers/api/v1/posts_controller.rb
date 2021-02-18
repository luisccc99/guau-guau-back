class Api::V1::PostsController < ApplicationController
#Get the id before request for update, delete or find.
    before_action :authorization, :get_post_id, only: [:update, :destroy, :show]
    #GET
    def index
        posts = Post.where("resolved = false", params[:resolved])
        if !posts.empty?
            render json: posts, status: :ok
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
            render json: new_post, status: :ok
        else
            render json: {message: "Unable to add new post."}, status: :conflict
        end
    end

    #PATCH
    def update
        if @found
            if @found.update(post_params)
                render json: @found, status: :ok
            else
                render json: {message: "Failed to update."}, status: :unprocessable_entity
            end
        else
            render json: {message: "Post not found"}, status: :no_content
        end
    end

    #DELETE
    def destroy
        if @found
            if @found.destroy()
                render json: {message: "Post destroyed"}, status: :ok
            else
                render json: {message: "Failed to delete"}, status: :conflict
            end
        else
            render json: {message: "Post not found"}, status: :no_content
        end
    end

    private
    def post_params
        #Checar si es necesario ingresar la FK o no. Omitida por el momento
        params.require(:post).permit(:title, :body, :photo, :resolved, :resolved_reason)
    end
    def get_post_id
        @found = Post.find(params[:id])
    end
end