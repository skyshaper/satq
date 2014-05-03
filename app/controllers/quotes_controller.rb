class QuotesController < ApplicationController
  before_filter :authenticate_user!

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.all
    
    if stale?(etag: view_context.cache_key_for_quotes) 
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :index }
      end
    end
  end

  # GET /quotes/person/foo
  # GET /quotes/person/foo.json
  def person
    @person = Person.find_by_name!(params[:person])
    @quotes = @person.quotes

    if stale?(etag: view_context.cache_key_for_quotes) 
      respond_to do |format|
        format.html { render :index }
        format.json { render :index }
      end
    end
  end

  def search
    @quotes = Quote.search(params[:q].strip)
    @search_query = params[:q]

    respond_to do |format|
      format.html { render :index }
      format.json { render :index }
    end
  end


  # GET /quotes/1
  # GET /quotes/1.json
  # GET /quotes/1.text
  def show
    @quote = Quote.find(params[:id])

    if stale?(@quote)
      respond_to do |format|
        format.html # show.html.erb
        format.text
        format.json
      end
    end
  end

  # GET /quotes/new
  # GET /quotes/new.json
  def new
    @quote = Quote.new

    respond_to do |format|
      format.html # new.html.erb
      format.js # new.js.erb
      format.json { render json: @quote }
    end
  end

  # GET /quotes/1/edit
  def edit
    @quote = Quote.find(params[:id])
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)
    @quote.changed_by = current_user

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote }
        format.js
        format.json { render json: @quote, status: :created, location: @quote }
      else
        format.html { render action: "new" }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /quotes/1/undo
  def undo
    @quote = Quote.find(params[:id])

    audited_changes = @quote.audited_changes
    old_values = {}
    audited_changes.each do |field, values|
      old_values[field] = values[0]
    end

    @quote.changed_by = current_user
    @quote.update_attributes!(old_values)

    respond_to do |format|
      format.html { redirect_to @quote }
      format.json { head :no_content }
      format.js   { render action: 'update' }
    end
  end

  # PUT /quotes/1
  # PUT /quotes/1.json
  def update
    @quote = Quote.find(params[:id])
    @quote.changed_by = current_user

    respond_to do |format|
      if @quote.update_attributes(quote_params)
        format.html { redirect_to @quote }
        format.json { head :no_content }
        format.js   { }
      else
        format.html { render action: "edit" }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_url }
      format.js { }
      format.json { head :no_content }
    end
  end
  
  protected
  
  def quote_params
    params.require(:quote).permit(:description, :raw_quote)
  end
end
