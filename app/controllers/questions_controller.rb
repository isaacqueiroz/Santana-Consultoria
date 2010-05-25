class QuestionsController < ApplicationController
  
  include AuthenticatedSystem
  
  layout 'application'
  
  before_filter :get_test, :get_test_tab, :get_questions, :get_question_number
  before_filter :check_administrator_role, :only => [:show, :destroy]
  
 
  # GET /test/1/questions
  # GET /test/1/questions.xml
  def index
    @questions = @test.questions.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end
  

  # GET /test/1/questions/1
  # GET /test/1/questions/1.xml
  def show
    @questions = @test.questions.find(:all)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /test/1/questions/new
  # GET /test/1/questions/new.xml
  def new
    @question = @test.questions.new
    @question_tab = @question_tabs[@q_number]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /test/1/questions/1/edit
  def edit
    @question = @test.questions.find(params[:id])
  end

  # POST /test/1/questions
  # POST /test/1/questions.xml
  def create
    @question = @test.questions.new(params[:question])  
    @question.question_tab_id = @question_tabs[@q_number].id    
    respond_to do |format|
      if @question.save
        @q_number = @q_number + 1
        format.html { redirect_to(new_test_question_path(@test)) }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.xml
  def update
    @question = @test.questions.find(params[:id])
    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to([@test,@question]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.xml
  def destroy
    @question = @test.questions.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(questions_url) }
      format.xml  { head :ok }
    end
  end
end

private


  def get_test
    @test = Test.find(params[:test_id])
  end
  
  def get_test_tab
    @test_tab = TestTab.find(@test.test_tab_id)
  end
  
  def get_questions
    @question_tabs = @test_tab.question_tabs.find(:all, :order => "id ASC")
  end
  
  def get_question_number
    @questions = @test.questions.find(:all)
    @q_number = @questions.length
  end
  
  def revoque_autorization
    @allow_test = AllowTest.find_by_user_id(@test.user.id)
    @allow_test.destroy
  end