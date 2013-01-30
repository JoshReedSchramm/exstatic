require 'spec_helper'

describe "When testing exstatic" do
  it "includes a dummy rails application" do
    RailsApp.should be_a(Module)
    Exstatic.should be_a(Module)
  end
end
