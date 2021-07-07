class ApplicationController < ActionController::Base
  include ActionController::Serialization

  def redirect_to_quotes
    redirect_to api_v1_quotes_path
  end
end
