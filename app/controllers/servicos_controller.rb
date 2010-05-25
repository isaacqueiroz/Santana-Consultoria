class ServicosController < ApplicationController

  include AuthenticatedSystem
  
	layout 'application'

	before_filter :check_administrator_role, :except => :index

  # GET /servicos
  # GET /servicos.xml
  def index
    @servicos = Servico.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @servicos }
    end
  end

  # GET /servicos/1
  # GET /servicos/1.xml
  def show
    @servico = Servico.find(params[:id])

    respond_to do |format|
      format.html # Exibir.html.erb
      format.xml  { render :xml => @servico }
    end
  end

  # GET /servicos/new
  # GET /servicos/new.xml
  def new
    @servico = Servico.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @servico }
    end
  end

  # GET /servicos/1/edit
  def edit
    @servico = Servico.find(params[:id])
  end

  # POST /servicos
  # POST /servicos.xml
  def create
    @servico = Servico.new(params[:servico])

    respond_to do |format|
      if @servico.save
        flash[:notice] = 'Texto de "Serviços Oferecidos" foi criado com sucesso.'
        format.html { redirect_to(@servico) }
        format.xml  { render :xml => @servico, :status => :created, :location => @servico }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @servico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /servicos/1
  # PUT /servicos/1.xml
  def update  
    @servico = Servico.find(params[:id])

    respond_to do |format|
      if @servico.update_attributes(params[:servico])
        flash[:notice] = 'Texto de "Serviços Oferecidos" foi atualizado com sucesso.'
        format.html { redirect_to(@servico) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @servico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /servicos/1
  # DELETE /servicos/1.xml
  def destroy
    @servico = Servico.find(params[:id])
    @servico.destroy

    respond_to do |format|
      format.html { redirect_to(servicos_url) }
      format.xml  { head :ok }
    end
  end
end
