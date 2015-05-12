class CircleFeedsController < ApplicationController
  before_action :set_circle_feed, only: [:show, :edit, :update, :destroy]

  # GET /circle_feeds
  # GET /circle_feeds.json
  def index
    @circle_feeds = CircleFeed.all
  end

  # GET /circle_feeds/1
  # GET /circle_feeds/1.json
  def show
  end

  # GET /circle_feeds/new
  def new
    @circle_feed = CircleFeed.new
  end

  # GET /circle_feeds/1/edit
  def edit
  end

  # POST /circle_feeds
  # POST /circle_feeds.json
  def create
    @circle_feed = CircleFeed.new(circle_feed_params)

    respond_to do |format|
      if @circle_feed.save
        format.html { redirect_to @circle_feed, notice: 'Circle feed was successfully created.' }
        format.json { render :show, status: :created, location: @circle_feed }
      else
        format.html { render :new }
        format.json { render json: @circle_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /circle_feeds/1
  # PATCH/PUT /circle_feeds/1.json
  def update
    respond_to do |format|
      if @circle_feed.update(circle_feed_params)
        format.html { redirect_to @circle_feed, notice: 'Circle feed was successfully updated.' }
        format.json { render :show, status: :ok, location: @circle_feed }
      else
        format.html { render :edit }
        format.json { render json: @circle_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /circle_feeds/1
  # DELETE /circle_feeds/1.json
  def destroy
    @circle_feed.destroy
    respond_to do |format|
      format.html { redirect_to circle_feeds_url, notice: 'Circle feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circle_feed
      @circle_feed = CircleFeed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def circle_feed_params
      params.require(:circle_feed).permit(:circle_id, :feed_id, :user_id)
    end
end
