class LexiquesController < ApplicationController
  before_filter :authenticate_admin!, :except => [:index, :show]
  # GET /lexiques
  # GET /lexiques.json
  def index
    if params[:lexique] and params[:lexique][:name]
      @lexiques = Lexique.where("name LIKE '%#{params[:lexique][:name]}%'").published
    elsif current_user and current_user.is_admin
      @lexiques = Lexique.all
    end

    redirect_to root_url if !@lexiques

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lexiques }
    end
  end

  # GET /lexiques/1
  # GET /lexiques/1.json
  def show
    @lexique = Lexique.where(:permalink => params[:permalink])
    redirect_to root_url if !@lexique or !@lexique.first

    @lexique = @lexique.first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lexique }
    end
  end

  # GET /lexiques/new
  # GET /lexiques/new.json
  def new
    @lexique = Lexique.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lexique }
    end
  end

  # GET /lexiques/1/edit
  def edit
    @lexique = Lexique.find(params[:id])
  end

  # POST /lexiques
  # POST /lexiques.json
  def create
    @lexique = Lexique.new(params[:lexique])

    respond_to do |format|
      if @lexique.save
        format.html { redirect_to lexiques_path, notice: 'Lexique was successfully created.' }
        format.json { render json: @lexique, status: :created, location: @lexique }
      else
        format.html { render action: "new" }
        format.json { render json: @lexique.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lexiques/1
  # PUT /lexiques/1.json
  def update
    @lexique = Lexique.find(params[:id])

    respond_to do |format|
      if @lexique.update_attributes(params[:lexique])
        format.html { redirect_to lexiques_path, notice: 'Lexique was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lexique.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lexiques/1
  # DELETE /lexiques/1.json
  def destroy
    @lexique = Lexique.find(params[:id])
    @lexique.destroy

    respond_to do |format|
      format.html { redirect_to lexiques_url }
      format.json { head :no_content }
    end
  end
end
