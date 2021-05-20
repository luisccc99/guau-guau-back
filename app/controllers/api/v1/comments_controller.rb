class Api::V1::CommentsController < ApplicationController
#Get the id before request for update, delete or find.
    #before_action :authorization, only: [:create, :update, :destroy, :show, :index]
    before_action :get_comment_id, only: [:update, :destroy, :show]
    #GET
    def index
        comment = Comment.all
        if !comment.empty?
            #render json: comment, status: :ok
            paginate Comment.unscoped, per_page: 5
        else
            render json: {message: "There's nothing here yet."}, status: :no_content
        end
    end

    #GET
    #singularGet
    def show
        if @found
           paginate Comment.unscoped.all.select("*").joins(:user).where("post_id = ?", params[:post_id]), per_page: 5
        else
            render json: {message: "Not found."}, status: :no_content
        end
    end

    #POST
    def create        
        new_comment = Comment.new(comment_params)
        if new_comment.save()
            render json: new_comment, status: :created
        else
            render json: {message: "Unable to comment."}, status: :conflict
        end
    end

    #PATCH
    def update
        if @found
            if @found.user_id != @user.id  
                render json: {message: "Access unauthorized."}, status: :unauthorized
            else
                if @found.update(comment_params)
                   render json: @found, status: :ok
                else
                    if @found.update(comment_params)
                        render json: @found_user, status: :ok
                    else
                        render json: {message: "Failed to update."}, status: :unprocessable_entity
                    end 
                    render json: {message: "Comment not found"}, status: :no_content
                end
            end
        end
    end

    #DELETE
    def destroy
        if @found
            if @found.user_id != @user.id
                render json: {message: "Access unauthorized."}, status: :unauthorized
            else
                if @found.destroy()
                    render json: {message: "Comment destroyed"}, status: :ok
                else
                    render json: {message: "Failed to delete"}, status: :conflict
                end
            end
        else
            render json: {message: "Comment not found"}, status: :no_content
        end
    end

    private
    def comment_params
        params.permit(:body, :post_id, :user_id)
    end
    def get_comment_id
        @found = Comment.where("post_id = ?", params[:post_id])
    end
    def get_user_id
        @found_user = Comment.find(params[:user_id])
    end
end