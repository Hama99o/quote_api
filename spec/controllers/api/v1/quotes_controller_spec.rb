require 'rails_helper'

RSpec.describe Api::V1::QuotesController, type: :controller do
  describe 'GET /index' do
    let(:one_author) { create(:author) }
    let(:quotes) { create_list(:quote, nb_quotes, author_id: one_author.id) }
    let(:nb_quotes) { 40 }

    context 'with quotes' do
      let(:nb_quotes) { 5 }

      before do
        quotes
      end

      subject { get :index }

      it 'return all quotes' do
        subject
        body = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(body['quotes'].count).to eq(5)
        expect(body['quotes'].count).not_to eq(6)
      end
    end

    context 'with search attributes' do
      context 'with name' do
        let(:author) { create(:author, name: 'jeck') }
        let(:quote) { create(:quote, author_id: author.id, quote_text: 'one day when i selp and i never woke up') }
        let(:search) { 'never woke' }

        before do
          quote
        end

        subject { get :index, params: { search: search } }

        it 'finds a searched quote' do
          subject
          body = JSON.parse(response.body)

          id = body['quotes'].first['id']
          expect(id).to eq(quote.id)
        end
      end
    end

    context 'with pagination' do
      context 'with page: 0' do
        subject { get :index, params: { page: 0 } }

        before do
          quotes
        end

        it 'has first page of quotes per 30' do
          subject
          body = JSON.parse(response.body)
          expect(body['quotes'].count).to eq(30)
        end
      end

      context 'with page: 1' do
        subject { get :index, params: { page: 1 } }

        before do
          quotes
        end

        it 'has the second page of quotes' do
          subject
          body = JSON.parse(response.body)
          expect(body['quotes'].count).to eq(10)
        end
      end
    end
  end

  describe 'GET /show' do
    let(:author) { create(:author) }
    let(:quote) { create(:quote, author_id: author.id) }

    subject { get :show, params: { id: quote.id } }

    before do
      quote
    end
    it 'has the the single show quotes' do
      subject
      expect(response).to have_http_status(:success)
      body = JSON.parse(response.body)
      expect(body['quote_author']).to eq(author.name)
      expect(body['quote_text']).to eq(quote.quote_text)
    end
  end

  describe 'GET /random' do
    let(:author) { create(:author) }
    let(:quote) { create(:quote, author_id: author.id) }

    context 'with random' do
      subject { get :random }

      before do
        quote
      end
      it 'has single quote' do
        subject
        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)
        expect(body['random_quote'].count).to eq(1)
        expect(body['random_quote'][0]['quote_genre']).to eq(quote.quote_genre)
      end
    end

    context 'with random quotes' do
      let(:quotes) { create_list(:quote, 3, author_id: author.id) }
      subject { get :random, params: { nb: 2 } }

      before do
        quotes
      end
      it 'has double quotes' do
        subject
        expect(response).to have_http_status(:success)
        body = JSON.parse(response.body)
        expect(body['random_quote'].count).to eq(2)
      end
    end
  end
end
