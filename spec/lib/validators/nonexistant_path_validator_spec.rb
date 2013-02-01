require 'spec_helper'

describe Exstatic::Validators::NonexistantPathValidator do
  context "when a path exists matching the one provided" do
    it "fails" do
      page = Exstatic::Page.new(:slug => "custompage")

      validator = Exstatic::Validators::NonexistantPathValidator.new({:attributes => {}})
      validator.validate_each(page, :slug, page.slug)

      page.errors[:slug].first.should == "matches an existing path"
    end
  end

  context "when no path exists matching the one provided" do
    it "succeeds" do
      page = Exstatic::Page.new(:slug => "brandnewpage")

      validator = Exstatic::Validators::NonexistantPathValidator.new({:attributes => {}})
      validator.validate_each(page, :slug, page.slug)

      page.errors[:slug].empty?.should == true

    end
  end
end
