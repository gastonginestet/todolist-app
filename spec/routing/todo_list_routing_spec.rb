require "rails_helper"

RSpec.describe TodoListsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/todolists").to route_to("todo_lists#index")
    end

    it "routes to #new" do
      expect(get: "/todolists/new").to route_to("todo_lists#new")
    end

    it "routes to #show" do
      expect(get: "/todolists/1").to route_to("todo_lists#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/todolists/1/edit").to route_to("todo_lists#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/todolists").to route_to("todo_lists#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/todolists/1").to route_to("todo_lists#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/todolists/1").to route_to("todo_lists#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/todolists/1").to route_to("todo_lists#destroy", id: "1")
    end
  end
end
