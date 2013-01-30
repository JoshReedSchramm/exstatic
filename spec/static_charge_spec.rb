require 'spec_helper'

describe "When testing static_charge" do
  it "includes a dummy rails application" do
    RailsApp.should be_a(Module)
  end
end
