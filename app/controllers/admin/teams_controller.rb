class Admin::TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to admin_teams_path
      flash[:notice] = "Your Team has been successfully updated."
    else
      render :edit
      flash[:notice] = "Please fill out the forms correctly."
    end
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
  end

  def destroy
    @team = Team.find(params[:id])
    if @team.destroy
      flash[:notice] = "Team successfully deleted"
      redirect_to admin_teams_path
    else
      flash[:alert] = "Failed to delete Team"
      redirect_to admin_teams_path
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :region_id)
  end

end
