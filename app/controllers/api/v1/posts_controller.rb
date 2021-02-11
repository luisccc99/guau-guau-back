class Api::V1::PostsController < ApplicationController
#TODO: Añadir validación
    #GET
    def getPosts
        posts = Post.all
        if !posts.empty?
            render json: posts, status: :ok
        else
            render json: {message: "There's nothing here yet."}, status: :unprocessable_entity
        end
    end

    #POST
    def addPost
        newPost = Post.new(postparams)

        if newPost.save()
            render json: newPost, status: :ok
        else
            render json: {message: "Unable to add new post."}, status: :conflict
    end

    #PATCH
    def patchPost
        if @findedpost
            if @findedpost.update(postparams)
                render json: @findedpost, status: :ok
            else
                render json: {message: "Failed to update."}, status: :unprocessable_entity
            end
        else
            render json: {message: "Post not found"}, status: :unprocessable_entity
        end
    end

    #DELETE
    def delPost
        if @findedpost
            if @findedpost.destroy()
                render json: {message: "Post destroyed"}, status: :ok
            else
                render json: {message: "Failed to delete"}, status: :unprocessable_entity
            end
        else
            render json: {message: "Post not found"}, status: :unprocessable_entity
        end
    end

    private
    def postparams
        #Checar si es necesario ingresar la FK o no. Omitida por el momento
        params.permit(:title, :body, :photo, :resolved, :resolved_reason)
    end
    def getPostID
        @findedpost = Post.find(params[:id])
    end
end