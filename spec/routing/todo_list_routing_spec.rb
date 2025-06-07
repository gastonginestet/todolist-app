require "rails_helper"

RSpec.describe TodolistsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/todolists").to route_to("todolists#index")
    end

    it "routes to #new" do
      expect(get: "/todolists/new").to route_to("todolists#new")
    end

    it "routes to #show" do
      expect(get: "/todolists/1").to route_to("todolists#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/todolists/1/edit").to route_to("todolists#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/todolists").to route_to("todolists#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/todolists/1").to route_to("todolists#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/todolists/1").to route_to("todolists#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/todolists/1").to route_to("todolists#destroy", id: "1")
    end
  end
end
