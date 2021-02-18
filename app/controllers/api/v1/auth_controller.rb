class AuthController < ApplicationController
    def login
        user = User.find_by(id: params[:id])

        if !user
            render json: {error: "Invalid user"}, status: :conflict
        elsif user.authenticate(params[:password])
            secret_key = Rails.application.secrets.secret_key_base[0]
            token = JWT.encode({user_id: user.id}, secret_key)
            render json: {message: "Correct credentials."}, status: :ok
        else
            render json: {message: "Wrong credentials."}, status: :unauthorized
        end

    end
end
