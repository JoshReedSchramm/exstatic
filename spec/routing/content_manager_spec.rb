require 'spec_helper'

describe "When visiting the content manager" do
  #I cannot for the life of me get a handle on the routes added by the engine
  #They DO get routed, if you run rake routes in the sample app
  pending "routes the index of the pages controller" do
    get("/pages").should route_to("static_charge/pages#index")
  end
end
