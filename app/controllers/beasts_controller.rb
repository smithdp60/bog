class BeastsController < ApplicationController

  def index
    @beasts = Beast.all
  end

  def new
    @beast = Beast.new
  end

  def create
    @beast = Beast.create(beast_params)
    redirect_to @beast
  end

  def show
    @beast = Beast.find(params[:id])
  end

  def edit
    @beast = Beast.find(params[:id])
  end

  def update
    @beast = Beast.find(params[:id])
    if @beast.update(beast_params)
      redirect_to @beast
    else
      render 'edit'
    end
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