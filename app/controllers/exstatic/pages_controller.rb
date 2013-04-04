class Exstatic::PagesController < ApplicationController
  before_filter Exstatic.authorization_method, :only => Exstatic.authorization_actions

  def index
    @pages = Exstatic::Page.all
  end

  def show
    @page = Exstatic::Page.find(params[:id])
  end

  def new
    @page = Exstatic::Page.new
  end

  def display
    @page = Exstatic::Page.where(:slug => stripped_path).first!
  end

  def create
    @page = Exstatic::Page.new(params[:page])
    if @page.save
      redirect_to @page
    else
      render :new
    end
  end

  private
  def authorize_exstatic_pages
    super if defined?(super)
  end

  def stripped_path
    request.fullpath.gsub(/^\//, "")
  end
end
