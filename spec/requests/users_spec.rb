require 'rails_helper'
require 'faker'

describe 'Users API', type: :request do

  describe 'GET /users' do

    context 'with no users registred' do
      it 'returns no content when there are not users' do
        get api_v1_users_path
        #TODO: expect message ... 

        expect(response.body).to be_empty
        expect(response).to have_http_status(:no_content)
      end  
    end

    context 'with a user registred' do
      let!(:user) {FactoryBot.create(:user)}

      it 'returns registred users' do
        get api_v1_users_path
        
        expect(JSON.parse(response.body).size).to eq 1
        expect(response).to have_http_status(:ok)
      end
    end
    
  end

  describe 'POST /users' do
    it 'creates new user' do
      params = {
        email: Faker::Internet.email,
        password: 'hello',
        name: Faker::Name.name.split()[0],
        lastname: Faker::Name.name.split()[1],
        num_posts: 0,
        resolved_posts: 0
      }

      expect {
      post api_v1_users_path, params: params
      }.to change { User.count }.from(0).to(1)
      
      expect(response).to have_http_status(:created)
    end

    it 'fails to create a user' do
      post api_v1_users_path

      parsed_body = JSON.parse(response.body)
      expect(parsed_body['message']).to eq('Unable to add new user.')
      expect(response).to have_http_status(:conflict)
    end

  end

end