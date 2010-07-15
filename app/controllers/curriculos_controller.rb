class CurriculosController < ApplicationController
  
  include AuthenticatedSystem
  
  layout 'application'
  
  before_filter :get_user
  before_filter :get_areas
  before_filter :login_required
  before_filter :check_administrator_role, :only => [:index]
  
  
  
  #GET /print
  def print
    @curriculo = Curriculo.find(params[:curriculo_id])
    @area1 = Area.find(@curriculo.area_id1)
    @area2 = Area.find(@curriculo.area_id2)
    @area3 = Area.find(@curriculo.area_id3)
    @escolaridades = @curriculo.escolaridades.all
    @exps = @curriculo.exps.all
    render :layout => 'curriculo_print'    
  end
  
  # GET /curriculos/1
  # GET /curriculos/1.xml
  def show
    if (params[:id].blank?)
      @curriculo = @user.curriculo
    else
      @curriculo = Curriculo.find(params[:id])
    end
    @area1 = Area.find(@curriculo.area_id1)
    @area2 = Area.find(@curriculo.area_id2)
    @area3 = Area.find(@curriculo.area_id3)
    @escolaridades = @curriculo.escolaridades.all
    @exps = @curriculo.exps.all
    render :layout => 'curriculo_show'
  end

  # GET /curriculos/new
  # GET /curriculos/new.xml
  def new

    @curriculo = @user.build_curriculo
    @curriculo.escolaridades.build
    @curriculo.exps.build
    render :layout => 'curriculo'
  end

  # GET /curriculos/1/edit
  def edit
    @curriculo = @user.curriculo
    render :layout => 'curriculo'
  end

  # POST /curriculos
  # POST /curriculos.xml
  def create
    @curriculo = @user.create_curriculo(params[:curriculo])

    respond_to do |format|
      if @curriculo.save
        flash[:notice] = 'Seu currículo foi criado com sucesso.'
        format.html { redirect_to(@user, @curriculo) }
        format.xml  { render :xml => @curriculo, :status => :created, :location => @curriculo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @curriculo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /curriculos/1
  # PUT /curriculos/1.xml
  def update
    params[:curriculo][:existing_exp_att] ||= {}
    params[:curriculo][:existing_escolaridade_att] ||= {}
  
    @curriculo = @user.curriculo
    respond_to do |format|
      if @curriculo.update_attributes(params[:curriculo])
        flash[:notice] = 'Seu currículo foi atualizado com sucesso.'
        format.html { redirect_to(@user, @curriculo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @curriculo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculos/1
  # DELETE /curriculos/1.xml
  def destroy
    @curriculo = Curriculo.find(params[:id])
    @curriculo.destroy

    respond_to do |format|
      format.html { redirect_to(curriculos_url) }
      format.xml  { head :ok }
    end
  end
end

private

  def get_user
    @user = current_user
  end
  
  def get_areas
    @areas = Area.all
    @areas = @areas.map{|u|[u.name,u.id]}
  end


