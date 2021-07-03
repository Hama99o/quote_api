class ApplicationController < ActionController::Base

  def redirect_to_quotes
    redirect_to api_v1_quotes_path
  end
end
