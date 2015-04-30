class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
    @tags = Tag.all
    redirect_to tags_path
  end

  def show
    @tag = Tag.find(params[:id])
    @beasts = @tag.beasts
  end

  def destroy
    @tag = Tag.find(params[:id])
    if @tag.beasts.length < 1
      @tag.destroy
    else
      flash[:danger] = "Can't delete; tag is currently assigned to a beast."
    end
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end