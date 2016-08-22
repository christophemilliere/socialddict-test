class SponsorshipService

  def initialize(user)
    @user = user
  end

  def sponsorship_count
    @user.not_sponsorship.count
  end

  def listing_sponsorship(number)
    count = @user.where.not(sponsorship_id: nil).group('sponsorship_id').order('sponsorship_id  DESC').limit(number).count(:sponsorship_id)
    listings = []
    count.each do |k, v|
      user = @user.find_by(id: k)
      listings << {user: user.fullname , count: v}
    end
    listings
  end

  def count_sponsorship(number)
    users = @user.where.not(sponsorship_id: nil).group('sponsorship_id').order('sponsorship_id  DESC').limit(number).count(:sponsorship_id)
    users.count
  end


end
