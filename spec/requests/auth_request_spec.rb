require 'rails_helper'

RSpec.describe "Auths", type: :request do

  describe "POST /login" do
    before (:each) do
      @user = FactoryBot.create(:user)
      @expected_message = "Correct credentials."
      @error_message = "Invalid user."
      @warning_message = "Wrong credentials."
    end

    context "with valid parameters" do  
      it "returns token with existing user" do
        params = {
          email: @user.email,
          password: @user.password
        }
        
        post api_v1_login_path, params: params
        parsed_body = JSON.parse(response.body)

        expect(parsed_body["message"]).to eq @expected_message
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do     
      it 'fails with unregistered user' do
        params = {
          email: Faker::Internet.email,
          password: "hello"
        }
        post api_v1_login_path, params: params
        parsed_body = JSON.parse(response.body)
        expect(parsed_body["error"]).to eq @error_message
        expect(response).to have_http_status(:conflict)
      end

      it 'fails with wrong password' do
        params = {
          email: @user.email,
          password: "incorrect_password"
        }
        post api_v1_login_path, params: params
        parsed_body = JSON.parse(response.body)
        expect(parsed_body["message"]).to eq @warning_message
        expect(response).to have_http_status(:unauthorized)
      end
    end

  end
end
