class PagesController < ApplicationController

  def index
  end

  def destroy
    SponsorshipService.new(User, params[:id]).reorganization_sponsorship
    redirect_to root_path, alert: 'Votre compte a bien été supprimé'
  end
end
