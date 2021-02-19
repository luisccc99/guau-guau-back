class ApplicationController < ActionController::API
    def authorization
        authorization_header = request.headers[:authorization]
        if !authorization_header
            render json: {message: "Unauthorized"}, status: :unauthorized
        else
        token = authorization_header.split(" ")[1]
        secret_key = Rails.application.secrets.secret_key_base[0]
        decoded_token = JWT.decode(token, secret_key)[0]
        
        @user = user.find(decoded_token["user_id"])
        end
    end
end
