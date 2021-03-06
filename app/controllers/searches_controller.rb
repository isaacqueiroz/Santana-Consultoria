class SearchesController < ApplicationController
  include AuthenticatedSystem
  layout 'application'


  before_filter :get_areas
  before_filter :login_required
  before_filter :check_administrator_role

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
    
    @curriculos = @search.curriculos.paginate :per_page => 5, :page => params[:page], :order => 'nome'    
  end
  
  def destroy
    @search = Search.find(params[:id])
    @search.destroy
  
    respond_to do |format|
      format.html { redirect_to(new_search_path) }
      format.xml  { head :ok }
    end
  end
end

def get_areas
  @areas = Area.all
  @areas = @areas.map{|u|[u.name,u.id]}
end

