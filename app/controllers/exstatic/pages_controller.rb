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

  def create
    @page = Exstatic::Page.new(params[:page])
    if @page.save
      redirect_to @page
    else
      render :new
    end
  end
end
