class QuotesController < ApplicationController

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # POST /quotes or /quotes.json
  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      render json: @quote, status: :created
    else
      render json: @quote.errors, status: :unprocessable_entity
    end
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
