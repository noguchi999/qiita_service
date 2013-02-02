class TomodachisController < ApplicationController
  # GET /tomodachis
  # GET /tomodachis.json
  def index
    @tomodachis = Tomodachi.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tomodachis }
    end
  end

  # GET /tomodachis/1
  # GET /tomodachis/1.json
  def show
    @tomodachi = Tomodachi.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tomodachi }
    end
  end

  # GET /tomodachis/new
  # GET /tomodachis/new.json
  def new
    @tomodachi = Tomodachi.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tomodachi }
    end
  end

  # GET /tomodachis/1/edit
  def edit
    @tomodachi = Tomodachi.find(params[:id])
  end

  # POST /tomodachis
  # POST /tomodachis.json
  def create
    @tomodachi = Tomodachi.new(params[:tomodachi])

    respond_to do |format|
      if @tomodachi.save
        format.html { redirect_to @tomodachi, notice: 'Tomodachi was successfully created.' }
        format.json { render json: @tomodachi, status: :created, location: @tomodachi }
      else
        format.html { render action: "new" }
        format.json { render json: @tomodachi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tomodachis/1
  # PUT /tomodachis/1.json
  def update
    @tomodachi = Tomodachi.find(params[:id])

    respond_to do |format|
      if @tomodachi.update_attributes(params[:tomodachi])
        format.html { redirect_to @tomodachi, notice: 'Tomodachi was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tomodachi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tomodachis/1
  # DELETE /tomodachis/1.json
  def destroy
    @tomodachi = Tomodachi.find(params[:id])
    @tomodachi.destroy

    respond_to do |format|
      format.html { redirect_to tomodachis_url }
      format.json { head :no_content }
    end
  end
end
