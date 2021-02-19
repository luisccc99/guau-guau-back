class Api::V1::CommentsController < ApplicationController
#Get the id before request for update, delete or find.
    before_action :authorization, :get_comment_id, only: [:update, :destroy, :show]
    #GET
    def index
        comment = Comment.all
        if !comment.empty?
            render json: comment, status: :ok
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
            if @found.update(comment_params)
                render json: @found, status: :ok
            else
                render json: {message: "Failed to update."}, status: :unprocessable_entity
            end
        else
            render json: {message: "Comment not found"}, status: :no_content
        end
    end

    #DELETE
    def destroy
        if @found
            if @found.destroy()
                render json: {message: "Comment destroyed"}, status: :ok
            else
                render json: {message: "Failed to delete"}, status: :conflict
            end
        else
            render json: {message: "Comment not found"}, status: :no_content
        end
    end

    private
    def comment_params
        params.permit(:body, :post, :user)
    end
    def get_comment_id
        @found = Comment.find(params[:id])
    end
end