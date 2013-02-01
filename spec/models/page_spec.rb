require 'spec_helper'

describe Exstatic::Page do
  it "can be saved" do
    page = Exstatic::Page.new(:title => "This is my page", :slug => "foo", :content => "This is some content")
    page.save.should be_true

    page2 = Exstatic::Page.where(:slug => "foo").first!
    page2.should == page
  end

  it "validates that another routes with the same path does not exist" do
    page = Exstatic::Page.new(:title => "foo", :content => "bar", :slug => "custompage")
    page.save.should be_false
    page.errors[:slug].should_not be_nil
  end
end
