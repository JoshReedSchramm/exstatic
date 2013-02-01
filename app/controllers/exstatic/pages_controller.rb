class Exstatic::PagesController < ApplicationController
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
  def stripped_path
    request.fullpath.gsub(/^\//, "")
  end
end
