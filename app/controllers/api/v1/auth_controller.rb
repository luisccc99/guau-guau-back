class Api::V1::AuthController < ApplicationController
    def login
        user = User.find_by(email: params[:email])

        if !user
            render json: {error: "Invalid user."}, status: :conflict
        elsif user.authenticate(params[:password])
            token, exp = JsonWebToken.encode({user_id: user.email}, secret_key)
            render json: {token: token, message: "Correct credentials.", expiration_time: exp.strftime('%d-%m-%Y %H:%M:%S')}, status: :ok
        else
            render json: {message: "Wrong credentials."}, status: :unauthorized
        end
    end
end
