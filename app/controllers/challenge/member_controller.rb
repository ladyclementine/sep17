class Challenge::MemberController < ApplicationController
  layout 'devise'
  before_action :set_challenge_team

  def new_inscription
    @members = []
    @errors = []
    @challenge_team.limit.times do |i|
      @members << Challenge::Member.new
    end
  end

  def create_inscription
    @members = params.require(:members)
    @errors = []
    @members.each do |index, member|
      @member = @challenge_team.challenge_members.new(member.permit(:name, :email))
      if !@member.save
        @errors << @member.errors
        byebug
      end
    end

    if @errors.empty?
      @pag = pag_seguro(100, @challenge_team)
      if @pag.errors.empty?
        redirect_to @pag.url
      else
        render :new_inscription, notice: "Erro ao efetuar pagamento! #{@pag.errors}"
      end
    else
      render :new_inscription, notice: 'Erro ao cadastrar equipe!'
    end
  end

  protected
  def set_challenge_team
    @challenge_team = Challenge::Team.find(params[:team_id])
    if !@challenge_team.challenge_members.empty?
      redirect_to challenge_new_team_inscription_path, notice: 'Time já possui membros cadastrados, tente criar outro time!'
    end
  end


  def pag_seguro(value, team)
    # O modo como você irá armazenar os produtos que estão sendo comprados
    # depende de você. Neste caso, temos um modelo Order que referência os
    # produtos que estão sendo comprados.
    order = team.id
    #payment = PagSeguro::PaymentRequest.new

    # Você também pode fazer o request de pagamento usando credenciais
    # diferentes, como no exemplo abaixo

    payment = PagSeguro::PaymentRequest.new

    payment.reference = order
    #payment.notification_url = notifications_url
    payment.redirect_url = challenge_new_team_inscription_url
    payment.sender = {
      email: team.email
    }
    # @cart.each do |product|
    payment.items << {
      id: team.id,
      description: "Desafio #{team.name}",
      amount: value.to_f
    }
    # end
    response = payment.register
  end

end
