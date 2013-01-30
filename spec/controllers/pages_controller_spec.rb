require 'spec_helper'

describe Exstatic::PagesController do
  it 'can render the listing page' do
    get :index, { :use_route => :exstatic }

    response.should be_success
    response.should render_template('index')
  end
end
