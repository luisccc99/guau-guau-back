require 'rails_helper'
require 'faker'

describe 'Posts API', type: :request do

  describe 'GET /posts' do

    it 'returns no content if theres any post' do
      get '/api/v1/posts'
  
      expect(response).to have_http_status(:no_content)
    end
  
    it 'returns all post' do
      FactoryBot.create(:user)
      FactoryBot.create(:post, title: Faker::DcComics.title, body: "I lost my pet", photo: "http://url.com/dh.jpg")
      get api_v1_posts_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /posts' do

    it 'creates a new post' do
      
    end
    
  end
end