require 'rails_helper'

RSpec.describe 'Pictures API', type: :request do
  # initialize test data 
  let!(:pictures) { create_list(:picture, 10) }
  let(:picture_id) { pictures.first.id }

  # Test suite for GET /pictures
  describe 'GET /pictures' do
    # make HTTP get request before each example
    before { get '/pictures', params: {} }

    it 'returns pictures' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /pictures/:id
  describe 'GET /pictures/:id' do
    before { get "/pictures/#{picture_id}", params:{} }

    context 'when the record exists' do
      it 'returns the picture' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(picture_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:picture_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

    end
  end

  # Test suite for POST /pictures
  describe 'POST /pictures' do
    # valid payload
    let(:valid_attributes) { { img_link: 'debs.io/img_link', created_by: 'debs', likes: 2, liked: true } }

    context 'when the request is valid' do
      before { post '/pictures', params: valid_attributes }

      it 'creates a picture' do
        expect(json['created_by']).to eq('debs')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/pictures', params: { img_link: 'Foobar.io' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test suite for DELETE /pictures/:id
  describe 'DELETE /pictures/:id' do
    before { delete "/pictures/#{picture_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end