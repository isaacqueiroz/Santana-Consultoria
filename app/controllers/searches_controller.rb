class SearchesController < ApplicationController
  include AuthenticatedSystem
  layout 'application'


  def new
    @search = Search.new
  end
  
  def create
    @search = Search.new(params[:search])
    @search.save
    redirect_to @search
  end
  
  def show
    @search = Search.find(params[:id])
  end
end
