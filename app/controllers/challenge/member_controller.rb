class Challenge::MemberController < ApplicationController
  layout 'devise_layout'
  before_action :set_challenge_team

  def new_inscription
    @members = []
    @challenge_team.limit.times do |i|
      @members << Challenge::Member.new
    end
  end

  def create_inscription
    @members = params[:members]

    @members.each do |index, member|
      @challenge_team.challenge_members.create(name: member[:name], email: member[:email])
    end

  end

  protected
  def set_challenge_team
    @challenge_team = Challenge::Team.find(params[:team_id])

    if !@challenge_team.challenge_members.empty?
      redirect_to challenge_new_team_inscription_path, error: 'Time cadastrado, agora insira sua equipe'
    end
  end

  def challenge_member_params(params)
    params.permit(:name, :email)
  end

end
