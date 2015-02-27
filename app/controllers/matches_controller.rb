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
  end

  private

  def match_params
    params.require(:match).permit(:name, :team1, :team2, :region_id, :date_played, :video_url)
  end

end
