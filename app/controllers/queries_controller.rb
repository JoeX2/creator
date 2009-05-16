class QueriesController < ApplicationController
  # GET /queries
  # GET /queries.xml
  def index
    @queries = Query.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @queries }
    end
  end

  # GET /queries/1
  # GET /queries/1.xml
  def show
    @query = Query.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @query }
    end
  end

  # GET /queries/new
  # GET /queries/new.xml
  def new
    @query = Query.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @query }
    end
  end

  # GET /queries/1/edit
  def edit
    @query = Query.find(params[:id])
  end

  # POST /queries
  # POST /queries.xml
  def create
    if params[:prayer] and params[:name]
      unless params[:profile].empty?
        @request = Request.first  :joins => :profiles, 
          :conditions => ["requests.action = ? and requests.name = ? and profiles.name = ?", 
            params[ :prayer ], 
            params[ :name ], 
            params[ :profile ]
          ]

        @profile = @request.profiles.first :conditions => ["name = ?", params[ :profile ] ]
        
        @query = Query.new
        @query.request = @request
        @query.profile = @profile
        @query.save
        
        res = "rem #{ @profile.inspect }, #{ @request.inspect } \r\necho will #{ @query.request.action } #{ @query.request.name }\r\n "
        render :text => res
      else
        render :text => "curl -b \"%workdir%\\cookies.txt\" -sS \"http://192.168.1.3:3000/queries\" -d \"authenticity_token=%authenticity_token%&prayer=#{params[:prayer]}&name=#{params[:name]}&profile=%USERNAME%\" > \"%workdir%\\session.cmd\" \r\n call %workdir%\\session.cmd \r\n  del %workdir%\\session.cmd \r\n"
      end
    else
#      @query = Query.new(params[:query])
#
#      respond_to do |format|
#        if @query.save
#          flash[:notice] = 'Query was successfully created.'
#          format.html { redirect_to(@query) }
#          format.xml  { render :xml => @query, :status => :created, :location => @query }
#        else
#          format.html { render :action => "new" }
#          format.xml  { render :xml => @query.errors, :status => :unprocessable_entity }
#        end
#      end
    end
  end

  # PUT /queries/1
  # PUT /queries/1.xml
  def update
    @query = Query.find(params[:id])

    respond_to do |format|
      if @query.update_attributes(params[:query])
        flash[:notice] = 'Query was successfully updated.'
        format.html { redirect_to(@query) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @query.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /queries/1
  # DELETE /queries/1.xml
  def destroy
    @query = Query.find(params[:id])
    @query.destroy

    respond_to do |format|
      format.html { redirect_to(queries_url) }
      format.xml  { head :ok }
    end
  end
end
