class JsonWebToken
    @secret_key = Rails.application.secrets.secret_key_base[0]
    def self.encode(payload, exp = 1.minutes.from_now)
        payload[:exp] = exp.to_i
        token = JWT.encode(payload, @secret_key)
        [token, exp]
    end

    def self.decode(token)
        payload = JWT.decode(token, @secret_key).first
        HashWithIndifferentAccess.new payload
    end
end