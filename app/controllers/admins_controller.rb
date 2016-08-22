class AdminsController < ApplicationController

  def index
    # @test = SponsorshipService.new(User).sponsorship_count
    @test = SponsorshipService.new(User).listing_sponsorship(3)
  end

  def listing_sponsorship
  end

  def listings_result
    if params[:number].present?
      @result_listing = SponsorshipService.new(User).listing_sponsorship(params[:number])
    else
      @error = " Vous n'avez pas ajouter un chiffire"
    end
  end
end
