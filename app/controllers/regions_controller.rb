class RegionsController < ApplicationController

  def index
    @region = Region.all.limit(10)
  end

  def new
    @region = Region.new
  end

  def show
    @region = Region.find(params[:id])
    @teams = Team.where(region_id: params[:id])
    @matches = Match.where(region_id: params[:id])
  end

  def create
    @region = Region.new(region_params)
    @region.save
    redirect_to regions_path
  end

  def edit
    @region = Region.find(params[:id])
  end

  def update
    @region = Region.find(params[:id])
    if @region.update(region_params)
      redirect_to admin_regions_path
      flash[:notice] = "Your Region has been successfully updated."
    else
      render :edit
      flash[:notice] = "Please fill out the forms correctly."
    end
  end

  def destroy
  @region = Region.find(params[:id])
    if @region.destroy
      redirect_to admin_path, notice: "Region Deleted Successfully"
    end
  end

  private

  def region_params
    params.require(:region).permit(:name, :abbreviation)
  end
end
