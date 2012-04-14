class PrecinctsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET /precincts
  # GET /precincts.json
  def index
    @precincts = Precinct.all(:order => "number")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @precincts }
    end
  end

  # GET /precincts/1
  # GET /precincts/1.json
  def show
    @precinct = Precinct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @precinct }
    end
  end

  # GET /precincts/new
  # GET /precincts/new.json
  def new
    @precinct = Precinct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @precinct }
    end
  end

  # GET /precincts/1/edit
  def edit
    @precinct = Precinct.find(params[:id])
  end

  # POST /precincts
  # POST /precincts.json
  def create
    @precinct = Precinct.new(params[:precinct])

    respond_to do |format|
      if @precinct.save
        format.html { redirect_to @precinct, notice: 'Precinct was successfully created.' }
        format.json { render json: @precinct, status: :created, location: @precinct }
      else
        format.html { render action: "new" }
        format.json { render json: @precinct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /precincts/1
  # PUT /precincts/1.json
  def update
    @precinct = Precinct.find(params[:id])

    respond_to do |format|
      if @precinct.update_attributes(params[:precinct])
        format.html { redirect_to @precinct, notice: 'Precinct was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @precinct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /precincts/1
  # DELETE /precincts/1.json
  def destroy
    @precinct = Precinct.find(params[:id])
    @precinct.destroy

    respond_to do |format|
      format.html { redirect_to precincts_url }
      format.json { head :no_content }
    end
  end
end
