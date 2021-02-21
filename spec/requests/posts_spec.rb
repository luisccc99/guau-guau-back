require 'rails_helper'
require 'faker'

describe 'Posts API', type: :request do

  describe 'GET /posts' do
    it 'fails with no token' do
      get api_v1_posts_path

      expect(response).to have_http_status(:unauthorized)
    end
  
    it 'returns all post' do
      FactoryBot.create(:user)
      FactoryBot.create(:post, title: Faker::DcComics.title, body: "I lost my pet", photo: "http://url.com/dh.jpg")
      get api_v1_posts_path

      byebug

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /posts' do

    it 'creates a new post' do
      
    end
    
  end
end

