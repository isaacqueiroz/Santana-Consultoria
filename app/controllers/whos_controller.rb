class WhosController < ApplicationController

  include AuthenticatedSystem
  
	layout 'application'

	before_filter :check_administrator_role, :except => :index

  # GET /whos
  # GET /whos.xml
  def index
    @whos = Who.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @whos }
    end
  end

  # GET /whos/1
  # GET /whos/1.xml
  def show
    @who = Who.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @who }
    end
  end

  # GET /whos/new
  # GET /whos/new.xml
  def new
    @who = Who.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @who }
    end
  end

  # GET /whos/1/edit
  def edit
    @who = Who.find(params[:id])
  end

  # POST /whos
  # POST /whos.xml
  def create
    @who = Who.new(params[:who])

    respond_to do |format|
      if @who.save
        flash[:notice] = 'Texto de "Quem Somos" foi criado com sucesso.'
        format.html { redirect_to(@who) }
        format.xml  { render :xml => @who, :status => :created, :location => @who }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @who.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /whos/1
  # PUT /whos/1.xml
  def update
    @who = Who.find(params[:id])

    respond_to do |format|
      if @who.update_attributes(params[:who])
        flash[:notice] = 'Texto de "Quem Somos" foi atualizado com sucesso.'
        format.html { redirect_to(@who) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @who.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /whos/1
  # DELETE /whos/1.xml
  def destroy
    @who = Who.find(params[:id])
    @who.destroy

    respond_to do |format|
      format.html { redirect_to(whos_url) }
      format.xml  { head :ok }
    end
  end
end
