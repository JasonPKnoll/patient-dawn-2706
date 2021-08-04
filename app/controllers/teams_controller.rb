class TeamsController < ApplicationController

  def new
  end

  def create
    Team.new(teams_params)
    redirect_to competition_path(params[:competition_id])
  end

  private
  def teams_params
    params.permit(:id, :hometown, :nickname, :competition_id)
  end

end
