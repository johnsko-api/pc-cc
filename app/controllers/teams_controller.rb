class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.save
    redirect_to teams_path
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      flash[:success] = "You've updated a team!"
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    flash[:success] = "You've deleted a team!"
    redirect_to teams_path
  end

  private

  def team_params
    params.require(:team).permit(:name, :region_id)
  end

end
