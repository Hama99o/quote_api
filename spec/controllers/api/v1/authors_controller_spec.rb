require 'rails_helper'

RSpec.describe Api::V1::AuthorsController, type: :controller do
  describe 'GET /index' do
    let(:authors) { create_list(:author, nb_author) }
    let(:nb_author) { 35 }

    context 'return all authors' do
      subject { get :index }

      before do
        authors
        nb_author
      end

      it 'has name and id' do
        subject
        body = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(body.count).to eq(30)
        expect(body.count).not_to eq(35)
      end
    end

    context 'return all authors' do
      let(:author) { create(:author, name: 'jeck') }
      let(:search) { 'je' }

      subject { get :index, params: { search: search } }

      before do
        authors
        author
        nb_author
      end

      it 'finds a searched author' do
        subject
        body = JSON.parse(response.body)
        id = body.first['id']
        expect(id).to eq(author.id)
      end
    end

    context 'with pagination page: 0' do
      subject { get :index, params: { page: 0 } }

      before do
        authors
      end

      it 'has first page of authors per 30' do
        subject
        body = JSON.parse(response.body)
        expect(body.count).to eq(30)
      end
    end

    context 'with pagination page: 1' do
      subject { get :index, params: { page: 1 } }

      before do
        authors
      end

      it 'has the second page of authors' do
        subject
        body = JSON.parse(response.body)
        expect(body.count).to eq(5)
      end
    end
  end

  describe 'GET /show' do
    let(:author) { create(:author) }

    subject { get :show, params: { id: author.id } }

    before do
      author
    end
    it 'has the the single show author' do
      subject
      expect(response).to have_http_status(:success)
      body = JSON.parse(response.body)
      expect(body['name']).to eq(author.name)
      expect(body['id']).to eq(author.id)
    end
  end

  describe 'GET /random' do
    let(:authors) { create_list(:author, nb_author) }

    context 'with random nb params' do
      let(:nb_author) { 35 }
      subject { get :random }

      before do
        authors
      end
      it 'has two authors' do
        subject
        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)
        expect(body['random_authors'].count).to eq(2)
      end
    end

    context 'with random authors nb params' do
      let(:nb_author) { 35 }
      subject { get :random, params: { nb: 4 } }

      before do
        authors
      end
      it 'has four quotes' do
        subject
        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)
        expect(body['random_authors'].count).to eq(4)
      end
    end

    context 'with random authors reject_id params' do
      let(:reject_id_author) { create(:author) }

      let(:nb_author) { 1 }
      subject { get :random, params: { reject_id: reject_id_author.id } }

      before do
        reject_id_author
        authors
      end
      it 'has not reject_id author' do
        subject
        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)
        expect(body['random_authors'][0]['id']).not_to eq(reject_id_author.id)
      end
    end
  end
end
