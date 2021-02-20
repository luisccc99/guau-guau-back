class ApplicationController < ActionController::API
    def authorization
        authorization_header = request.headers[:authorization]
        if !authorization_header
            render json: {message: "Unauthorized"}, status: :unauthorized
        else
        token = authorization_header.split(" ")[1]
        payload = JsonWebToken.decode(token)
        
        @user = User.find(decoded_token["user_email"])
        end
        
    rescue JWT::DecodeError => e
        render json: {errors: e.message}, status: :forbidden  
    end
end
