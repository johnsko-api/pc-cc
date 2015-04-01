class MatchesController < ApplicationController

  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    @match.save
    redirect_to matches_path
  end

  def show
    @match = Match.find(params[:id])
    @video = "#{@match.video_url}".sub("watch?v=", "v/")
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    if @match.update(match_params)
      flash[:success] = "You've updated a match!"
      redirect_to @match
    else
      render 'edit'
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
      flash[:success] = "You've deleted a match!"
    redirect_to matches_path
  end

  private

  def match_params
    params.require(:match).permit(:name, :region_id, :date_played, :video_url, :team1, :team2)
  end

end
