require 'spec_helper'

describe Exstatic::PagesController do
  describe "GET index" do
    it 'can render the listing page' do
      pages = [mock]
      Exstatic::Page.stub(:all).and_return(pages)
      get :index, { :use_route => :exstatic }

      response.should be_success
      response.should render_template('index')
      assigns(:pages).should == pages
    end
  end


  describe "GET new" do
    it 'can serve a form to create a new page' do
      get :new, { :use_route => :exstatic }

      response.should render_template('new')
    end
  end

  describe 'POST create' do
    context 'and the page is valid' do
      it 'redirects to the page details' do
        page = mock_model(Exstatic::Page)

        Exstatic::Page.stub(:new).and_return(page)
        page.should_receive(:save).and_return(true)

        post :create, {:page => { :title => "foo" }, :use_route => :exstatic }

        response.should redirect_to page_path(page)
      end
    end

    context 'and the page is invalid' do
      it 'rerenders the form' do
        page = mock(Exstatic::Page)

        Exstatic::Page.stub(:new).and_return(page)
        page.should_receive(:save).and_return(false)

        post :create, {:page => { :title => "foo" }, :use_route => :exstatic }

        response.should render_template(:new)
      end
    end
  end

  describe "GET show" do
    it "renders the page" do
      page = mock_model(Exstatic::Page)
      Exstatic::Page.stub(:find).and_return(page)

      get :show, {:id => 1, :use_route => :exstatic}

      response.should render_template(:show)
      assigns(:page).should == page
    end
  end
end
