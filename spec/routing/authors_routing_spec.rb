require "rails_helper"

RSpec.describe Api::V1::AuthorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "api/v1/authors").to route_to(format: :json, controller: "api/v1/authors", action: "index")
    end

    it "routes to #show" do
      expect(get: "api/v1/authors/1").to route_to(format: :json, controller: "api/v1/authors", action: "show", id: "1")
    end

    it "routes to #index" do
      expect(get: "api/v1/authors/random").to route_to(format: :json, controller: "api/v1/authors", action: "random")
    end
  end
end
