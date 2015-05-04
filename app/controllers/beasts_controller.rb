class BeastsController < ApplicationController

  def index
    @beasts = Beast.all
    @tags = Tag.all
  end

  def new
    @beast = Beast.new
    @tags = Tag.all
  end

  def create
    @beast = Beast.create(beast_params)
    tags = params[:beast][:tag_ids]
    tags.each do |tag_id|
      @beast.tags << Tag.find(tag_id) unless tag_id.blank?
    end
    redirect_to @beast
  end

  def show
    @beast = Beast.find(params[:id])
    @tags = @beast.tags
    list = flickr.photos.search :text => @beast.name, :sort => "relevance"
    number = rand(0..3)
    id = list[number].id
    secret = list[number].secret
    info = flickr.photos.getInfo :photo_id => id, :secret => secret
    @url = FlickRaw.url(info)

  end

  def edit
    @beast = Beast.find(params[:id])
    @tags = Tag.all
  end

  def update
    @beast = Beast.update(params[:id], beast_params)

    @beast.tags.clear
    tags = params[:beast][:tag_ids]
    tags.each do |tag_id|
      @beast.tags << Tag.find(tag_id) unless tag_id.blank?
    end
    redirect_to @beast
  end

  def destroy
    @beast = Beast.find(params[:id])
    @beast.destroy
    redirect_to beasts_path
  end

  private

  def beast_params
    params.require(:beast).permit(:name,:description)
  end

end