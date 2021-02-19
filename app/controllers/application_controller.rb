class ApplicationController < ActionController::API
    def authorization
        authorization_header = request.headers[:authorization]
        if !authorization_header
            render json: {message: "Unauthorized"}, status: :unauthorized
        else
        token = authorization_header.split(" ")[1]
        secret_key = Rails.application.secrets.secret_key_base[0]
        decoded_token = JWT.decode(token, secret_key)[0]
        
        @user = User.find(decoded_token["user_email"])
        end
    end

    def authenticate!
        token = request.headers['Authorization']&.split(' ').last
        payload = JsonWebToken.decode(token)
        @current_user = User.find(payload[:user_id])

    rescue JWT::DecodeError => e 
        render json: {errors: e.message}, status: :forbidden  
    end
end
