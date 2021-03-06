class AdminsController < ApplicationController

  def index
  end

  def not_sponsorschip
    @not_sponsorship = SponsorshipService.new(User).not_sponsorship
  end

  def listing_sponsorship
  end

  def listing_more_sponsorship
  end

  def search_sponsorship_init
    @godchilds = User.select(:email, :sponsorship_id).where.not(sponsorship_id: nil)
  end

  def search_sponsorship_result
    sponsorship_service = SponsorshipService.new(User, params[:godchilds])
    @user = sponsorship_service.search_sponsorship
    @godchilds = sponsorship_service.all_godchilds_for_sponsorship
  end

  def more_sponsorship_result
    if params[:number].present?
      @result_more_sponsorship = SponsorshipService.new(User,params[:number]).users_more_sponsorship
    else
      @error = " Vous n'avez pas ajouté un chiffire"
    end
  end

  def listings_result
    if params[:number].present?
      @result_listing = SponsorshipService.new(User).listing_sponsorship(params[:number])
    else
      @error = " Vous n'avez pas ajouté un chiffire"
    end
  end
end
