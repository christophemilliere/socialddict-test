class SponsorshipService
 attr_reader :number

  def initialize(user, _number = nil)
    @user = user
    @number = _number
  end

  def sponsorship_count
    @user.not_sponsorship.count
  end

  def search_sponsorship
    @user.find_by(id: number)
  end

  def all_godchilds_for_sponsorship
    @user.where(sponsorship_id: number)
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

  def users_more_sponsorship
    users = @user.where.not(sponsorship_id: nil).group('sponsorship_id').order('sponsorship_id  DESC').having("COUNT(sponsorship_id) >= #{number}").count(:sponsorship_id)
    listings = []
    users.each do |k, v|
      user = @user.find_by(id: k)
      listings << {user: user.fullname , count: v}
    end
    listings
  end
end
