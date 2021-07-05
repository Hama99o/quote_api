class Api::V1::QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show ]

  # GET /quotes or /quotes.json
  def index
    render json: {
      quotes: Quote.all
    }
  end

  # GET /quotes/1 or /quotes/1.json
  def show
    render json: @quote
  end

  # GET /quotes/authors
  def authors
    render json: {
      authors: Quote.all.map(&:author)
    }
  end

  # GET /quotes/random
  def random
    total_quote = Quote.all.count
    random_quote = Quote.find(rand(total_quote))
    render json: {
      random: random_quote
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      params.require(:quote).permit(:qoute, :author)
    end
end
