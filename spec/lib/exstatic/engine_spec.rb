require 'spec_helper'

describe Exstatic::Engine do
  it "dynamically adds routes from pages at initialization" do
    Exstatic::Page.create(:slug => "rspec/test", :title => "Rspec Test", :content => "This is an rspec test")

    initializer = Exstatic::Engine.initializers.select { |i| i.name == "exstatic.bind_dynamic_routes" }.first
    initializer.run(Rails.application)

    route = Rails.application.routes.recognize_path("/rspec/test", :method => :get)
    route.should_not be_nil
  end

  it "does preserves existing routes" do
    initializer = Exstatic::Engine.initializers.select { |i| i.name == "exstatic.bind_dynamic_routes" }.first
    initializer.run(Rails.application)

    route = Rails.application.routes.recognize_path("/custompage", :method => :get)
    route.should_not be_nil
    route[:controller].should == "home"
  end

  it "does not override pre-existing routes" do
    p = Exstatic::Page.new(:slug => "custompage", :title => "Rspec Test", :content => "This is an rspec test")
    p.save(:validate => false)

    verify_saved = Exstatic::Page.where(:slug => "custompage").first!
    verify_saved.should_not be_nil

    initializer = Exstatic::Engine.initializers.select { |i| i.name == "exstatic.bind_dynamic_routes" }.first
    initializer.run(Rails.application)

    route = Rails.application.routes.recognize_path("/custompage", :method => :get)
    route.should_not be_nil
    route[:controller].should == "home"
  end
end
