class SponsorshipsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  before_action :set_user, only: [:friend]

  def index
  end

  def add_godchild
    # create filleul
    return redirect_to root_path, alert: " Vous êtes déja inscrit" if User.find_by(email: params[:email_sponsorship])

    if params[:email_sponsorship]
      pwd = Digest::MD5.hexdigest(params[:email_sponsorship])
      user = User.new(email: params[:email_sponsorship], password: pwd, password_confirmation: pwd, sponsorship_id: params[:sponsorships_id])
      if user.save
        SponsorshipMailer.send_password(user, pwd).deliver_now
        redirect_to root_path(params[:sponsorship]), notice: "Vous allez recevoir un email avec votre mots de passe provisoire." and return
      end
    else
      redirect_to root_path, alert: "Une erreur est survenue veuillez contacter le site." and return
    end
  end

  def friend
    SponsorshipMailer.invite_sponsorship(params[:email], @user).deliver_now
    redirect_to  sponsorships_path, notice: 'Votre email à bien été envoyé.'
  end

  private

  def set_user
    @user = User.find_by(id: params[:user])
  end
end
