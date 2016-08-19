class SponsorshipsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    if params[:email] && params[:email_sponsorship]
      user = User.find_by(id: params[:email_sponsorship])
      pwd = Digest::MD5.hexdigest(params[:email])
      User.create(email: params[:email], password: pwd, password_confirmation: pwd, sponsorship_id: user.id)
      redirect_to root_path(params[:sponsorship]), notice: "Veuillez vous connecté avec le mot de passe #{pwd}"
    else
      redirect_to root_path
    end

  end
end
