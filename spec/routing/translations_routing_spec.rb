require "spec_helper"

describe Admin::TranslationsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/translations").should route_to("admin/translations#index")
    end

    it "routes to #new" do
      get("/admin/translations/new").should route_to("admin/translations#new")
    end

    it "routes to #show" do
      get("/admin/translations/1").should route_to("admin/translations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/translations/1/edit").should route_to("admin/translations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/translations").should route_to("admin/translations#create")
    end

    it "routes to #update" do
      put("/admin/translations/1").should route_to("admin/translations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/translations/1").should route_to("admin/translations#destroy", :id => "1")
    end

  end
end
