class Api::V1::UsersController < ApplicationController
#Get the id before request for update, delete or find.
before_action :get_user_id, only: [:update, :destroy, :show]
    #GET
    def index
        user = User.all
        if !user.empty?
            render json: user, status: :ok
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
        new_user = User.new(user_params)

        if new_user.save()
            render json: new_user, status: :created
        else
            render json: {message: "Unable to comment."}, status: :conflict
        end
    end

    #PATCH
    def update
        if @found
            if @found.update(user_params)
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
            if @found.destroy(user_params)
                render json: @found, status: :ok
            else
                render json: {message: "Failed to delete."}, status: :unprocessable_entity
            end
        else
            render json: {message: "Comment not found"}, status: :no_content
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :name, :lastname, :num_posts, :resolved_posts)
    end
    def get_user_id
        @found = User.find(params[:id])
    end

end