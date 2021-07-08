require "rails_helper"

RSpec.describe Api::V1::QuotesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "api/v1/quotes").to route_to(format: :json, controller: "api/v1/quotes", action: "index")
    end

    it "routes to #show" do
      expect(get: "api/v1/quotes/1").to route_to(format: :json, controller: "api/v1/quotes", action: "show", id: "1")
    end

    it "routes to #index" do
      expect(get: "api/v1/quotes/random").to route_to(format: :json, controller: "api/v1/quotes", action: "random")
    end
  end
end
