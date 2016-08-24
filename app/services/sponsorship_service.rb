class SponsorshipService
 attr_reader :number
 attr_accessor :user

  def initialize(user, _number = nil)
    @user = user
    @number = _number
  end

  def not_sponsorship
    sponsorship_ids = user.select(:sponsorship_id).distinct.where.not(sponsorship_id: nil).pluck(:sponsorship_id)
    user.where.not(id: sponsorship_ids)
  end

  def search_sponsorship
    user.find_by(id: number)
  end

  def all_godchilds_for_sponsorship
    user.where(sponsorship_id: number)
  end

  def listing_sponsorship(number)
    count = user.where.not(sponsorship_id: nil).group('sponsorship_id').order('sponsorship_id  DESC').limit(number).count(:sponsorship_id)
    listings(count)
  end

  def users_more_sponsorship
    users = user.where.not(sponsorship_id: nil).group('sponsorship_id').order('sponsorship_id  DESC').having("COUNT(sponsorship_id) >= #{number}").count(:sponsorship_id)
    listings(users)
  end

  def reorganization_sponsorship
    if sponsorship && all_godchilds_for_sponsorship
      all_godchilds_for_sponsorship.each do |s|
        s.update_attribute(:sponsorship_id, sponsorship.id)
      end
    end
    user.find_by(id: number).destroy
  end

  private
  def sponsorship
    u = user.find_by(id: number)
    user.find_by(id: u.sponsorship_id)
  end

  def listings(objet)
    listings = []
    objet.each do |k, v|
      u = user.find_by(id: k)
      fullname_or_email = u.firstname.nil? && u.lastname.nil? ? u.email : u.fullname
      listings << { user: fullname_or_email, count: v }
    end
    listings
  end
end
