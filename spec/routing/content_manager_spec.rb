require 'spec_helper'

describe "When visiting the content manager" do
  context "when using the default configuration" do
    pending "should route the index of the content_manager controller" do
      { :get => "/content_manager" }.should route_to(:controller => "static_charge/content_manager", :action => "index")
    end
  end
end
