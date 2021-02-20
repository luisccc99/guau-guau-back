class ApplicationController < ActionController::API
    def authorization
        authorization_header = request.headers['Authorization']&.split(' ').last
        if !authorization_header
            render json: {message: "Unauthorized"}, status: :unauthorized
        else
        payload = JsonWebToken.decode(token)
        
        @user = User.find(payload[:user_email])
        end
        
    rescue JWT::DecodeError => e
        render json: {errors: e.message}, status: :forbidden  
    end
end
