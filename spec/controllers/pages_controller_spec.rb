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


  it 'can serve a form to create a new page' do
    # fake a login
    get :new, { :use_route => :exstatic }

    response.should render_template('new')
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

  describe "GET display" do
    it "renders the page based on the request path" do
      page = mock_model(Exstatic::Page)

      request.stub(:fullpath).and_return("/the/page/path")
      Exstatic::Page.stub(:where).with(:slug => "the/page/path").and_return(page)
      page.stub(:first!).and_return(page)

      get :display, { :use_route => :exstatic }

      response.should be_success
      response.should render_template(:display)

      assigns(:page).should == page
    end
  end

  context "When authorizing the user to make changes to a page" do
    describe "when the default method is defined in application controller" do
      before(:each) do
        class ApplicationController
          private 
          def authorize_exstatic_pages
            render :status => 402 and return
          end
        end
      end
      it "returns a 402 auth failure" do
        get :new, { :use_route => :exstatic }
        response.status.should == 402
      end
    end

    describe "when a custom method has been defined" do
      before(:each) do
        Exstatic.authorization_method = :custom_page_auth
        class ApplicationController
          private 
          def custom_page_auth
            render :status => 402 and return
          end
        end
      end
      it "returns a 402 auth failure" do
        get :new, { :use_route => :exstatic }
        response.status.should == 402
      end
    end

    describe "when secure methods have been overridden" do
      before(:each) do
        class ApplicationController
          private 
          def authorize_exstatic_pages
            render :status => 402 and return
          end
        end
      end
      it "allows access to the non-filtered method" do
        get :index, { :use_route => :exstatic }
        response.status.should == 200
      end

      it "returns a 402 auth failure for filtered methods" do
        get :new, { :use_route => :exstatic }
        response.status.should == 402
      end
    end
  end
end
