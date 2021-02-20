require 'rails_helper'
require 'faker'

describe 'Users API', type: :request do

  describe 'GET /users' do
    it "return no content when there are not users" do
      get api_v1_users_path
      
      expect(response).to have_http_status(:no_content)
    end
  end

  describe 'POST /users' do

    it 'creates new user' do
      params = {
        user: {
          email: Faker::Internet.email,
          password: 'hello',
          name: Faker::Name.name.split()[0],
          lastname: Faker::Name.name.split()[1],
          photo: "http://url.com/dh.jpg",
          num_posts: 0,
          resolved_posts: 0
        }
      }

      expect {
      post api_v1_users_path, params: params
      }.to change { User.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end

  end

end