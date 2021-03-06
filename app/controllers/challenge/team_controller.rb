class Challenge::TeamController < ApplicationController
  layout 'devise'

  def new_inscription
    @team = Challenge::Team.new()
  end

  def create_inscription
    @team = Challenge::Team.new(challenge_team_params)
    if @team.save
      redirect_to challenge_new_members_inscription_path(@team), notice: 'Time cadastrado, agora insira sua equipe'
    else
      render :new_inscription
    end
  end

  protected
  def challenge_team_params
    params.require(:challenge_team).permit(:name, :limit, :email, :payment_method)
  end

end
