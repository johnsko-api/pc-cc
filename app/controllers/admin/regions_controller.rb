class Admin::RegionsController < ApplicationController

  def index
    @regions = Region.all
  end

  def new
    @region = Region.new
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

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)
  end

  def destroy
    @region = Region.find(params[:id])
    if @region.destroy
      flash[:notice] = "Region successfully deleted"
      redirect_to admin_regions_path
    else
      flash[:alert] = "Failed to delete Region"
      redirect_to admin_regions_path
    end
  end

  private

  def region_params
    params.require(:region).permit(:name, :abbreviation)
  end

end
