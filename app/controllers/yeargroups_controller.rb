class YeargroupsController < ApplicationController
  before_filter :authenticate_user!
    
  # GET /yeargroups
  # GET /yeargroups.json
  def index
    @yeargroups = Yeargroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yeargroups }
    end
  end

  # GET /yeargroups/1
  # GET /yeargroups/1.json
  def show
    @yeargroup = Yeargroup.find(params[:id])
    @notes = @yeargroup.notes
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yeargroup }
    end
  end

  # GET /yeargroups/new
  # GET /yeargroups/new.json
  def new
    @yeargroup = Yeargroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @yeargroup }
    end
  end

  # GET /yeargroups/1/edit
  def edit
    @yeargroup = Yeargroup.find(params[:id])
  end

  # POST /yeargroups
  # POST /yeargroups.json
  def create
    @yeargroup = Yeargroup.new(params[:yeargroup])

    respond_to do |format|
      if @yeargroup.save
        format.html { redirect_to @yeargroup, notice: 'Yeargroup was successfully created.' }
        format.json { render json: @yeargroup, status: :created, location: @yeargroup }
      else
        format.html { render action: "new" }
        format.json { render json: @yeargroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /yeargroups/1
  # PUT /yeargroups/1.json
  def update
    @yeargroup = Yeargroup.find(params[:id])

    respond_to do |format|
      if @yeargroup.update_attributes(params[:yeargroup])
        format.html { redirect_to @yeargroup, notice: 'Yeargroup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @yeargroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yeargroups/1
  # DELETE /yeargroups/1.json
  def destroy
    @yeargroup = Yeargroup.find(params[:id])
    @yeargroup.destroy

    respond_to do |format|
      format.html { redirect_to yeargroups_url }
      format.json { head :no_content }
    end
  end
end
