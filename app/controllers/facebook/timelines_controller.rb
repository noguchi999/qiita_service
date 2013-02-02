class Facebook::TimelinesController < ApplicationController
  include Facebook::TimelinesHelper

  before_filter :parse_facebook_cookies

  def parse_facebook_cookies
    facebook_cookies
  end

  # GET /facebook/timelines
  # GET /facebook/timelines.json
  def index
    unless access_token
      redirect_to controller: 'facebook/oauths', action: 'welcome'
      return
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { head :no_content }
    end
  end

  def search
    @friends = graph.get_connections("me", "friends").map do |friend|
      friend
    end
    logger.debug "search_log2: #{@friends}"

    render json: { status: 'success', friends: @friends}
  end

  # GET /facebook/timelines/1
  # GET /facebook/timelines/1.json
  def show
    @facebook_timeline = Facebook::Timeline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @facebook_timeline }
    end
  end

  # GET /facebook/timelines/new
  # GET /facebook/timelines/new.json
  def new
    @facebook_timeline = Facebook::Timeline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @facebook_timeline }
    end
  end

  # GET /facebook/timelines/1/edit
  def edit
    @facebook_timeline = Facebook::Timeline.find(params[:id])
  end

  # POST /facebook/timelines
  # POST /facebook/timelines.json
  def create
    @facebook_timeline = Facebook::Timeline.new(params[:facebook_timeline])

    respond_to do |format|
      if @facebook_timeline.save
        format.html { redirect_to @facebook_timeline, notice: 'Timeline was successfully created.' }
        format.json { render json: @facebook_timeline, status: :created, location: @facebook_timeline }
      else
        format.html { render action: "new" }
        format.json { render json: @facebook_timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /facebook/timelines/1
  # PUT /facebook/timelines/1.json
  def update
    @facebook_timeline = Facebook::Timeline.find(params[:id])

    respond_to do |format|
      if @facebook_timeline.update_attributes(params[:facebook_timeline])
        format.html { redirect_to @facebook_timeline, notice: 'Timeline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @facebook_timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facebook/timelines/1
  # DELETE /facebook/timelines/1.json
  def destroy
    @facebook_timeline = Facebook::Timeline.find(params[:id])
    @facebook_timeline.destroy

    respond_to do |format|
      format.html { redirect_to facebook_timelines_url }
      format.json { head :no_content }
    end
  end
end
