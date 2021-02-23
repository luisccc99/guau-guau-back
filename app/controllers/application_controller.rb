class ApplicationController < ActionController::API
    def authorization
        if request.headers.key?("Authorization") 
            authorization_header = request.headers['Authorization']&.split(' ').last
        end
        if !authorization_header
            render json: {message: "Unauthorized"}, status: :unauthorized
        else
        payload = JsonWebToken.decode(@token)
        @user = User.find_by(email: payload[:user_email])
        end
        
    rescue  JWT::DecodeError => e
        render json: {errors: e.message}, status: :forbidden  
    end

end
