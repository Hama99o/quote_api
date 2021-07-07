class Api::V1::AuthorsController < ApplicationController
  before_action  :all_authors_with_authors, only: %i[index]
  
  # GET /authors
  def index
    render json: @authors
  end

  # GET /authors/1
  def show
    render json: Author.find(params[:id])
  end

  # GET /authors/random
  def random
    nb = params[:nb].try(:to_i) || 2
    reject_id = params[:reject_id].try(:to_i)
    random_author = Author.where.not(id: reject_id).order('RANDOM()').limit(nb)
    render json: {
      random: random_author.pluck(:name)
    }
  end

  private

  def authors(search)
    authors = Author.order(name: :asc)
    if search
      authors.where('name LIKE :search', search: "%#{params[:search]}%")
    else
      authors.all
    end
  end

  def paginated_authors(search, page, per)
    result = authors(search)
    result = result.offset(page * per).limit(per) if per
    result
  end

  def nb_pages(search, per)
    authors = authors(search)
    (authors.count.to_f / per).ceil
  end

  def all_authors_with_authors
    @per =  params[:per].try(:to_i) || 30
    @page = params[:page].try(:to_i) || 0
    @search = params[:search]
    @authors = paginated_authors(@search, @page, @per)
  end
end
