class Api::V1::QuotesController < ApplicationController
  before_action :all_quotes_with_authors, only: %i[index]

  # GET /quotes
  def index
    nb_pages = @per ? nb_pages(@search, @per) : nil
    meta = {
      page: @page,
      per: @per,
      nb_pages: nb_pages,
      total_quotes: Quote.count,
      search: params[:search]
    }
    render json: {
      quotes: @quotes.map { |quote| QuoteSerializer.new(quote) },
      meta: meta
    }
  end

  # GET /quotes/1
  def show
    render json: Quote.find(params[:id])
  end

  # GET /quotes/random
  def random
    nb = params[:nb].try(:to_i) || 1
    random_quote = Quote.order('RANDOM()').limit(nb)
    render json: {
      random_quote: random_quote.map { |quote| QuoteSerializer.new(quote) }
    }
  end

  private

  def quotes(search)
    quotes = Quote.order(quote_text: :asc)
    if search
      quotes.joins(:author)
            .where('authors.name ILIKE :search OR quote_text ILIKE :search', search: "%#{params[:search]}%")
    else
      quotes.all
    end
  end

  def paginated_quotes(search, page, per)
    result = quotes(search)
    result = result.offset(page * per).limit(per) if per
    result
  end

  def nb_pages(search, per)
    quotes = quotes(search)
    (quotes.count.to_f / per).ceil
  end

  def all_quotes_with_authors
    @per =  params[:per].try(:to_i) || 30
    @page = params[:page].try(:to_i) || 0
    @search = params[:search]
    @quotes = paginated_quotes(@search, @page, @per)
  end
end
